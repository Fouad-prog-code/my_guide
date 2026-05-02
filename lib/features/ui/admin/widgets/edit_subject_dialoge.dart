import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_data.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_data.dart';
import 'package:my_guide/features/ui/admin/screens/department_screen/cubit/department_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_states.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSubjectDialog extends StatefulWidget {
  final GetSubjectData subject;
  final List<GetDoctorData> doctors;
  final SubjectViewModel viewModel;
  final DepartmentViewModel departmentViewModel;

  const EditSubjectDialog({
    super.key,
    required this.subject,
    required this.doctors,
    required this.viewModel,
    required this.departmentViewModel,
  });

  @override
  State<EditSubjectDialog> createState() => _EditSubjectDialogState();
}

class _EditSubjectDialogState extends State<EditSubjectDialog> {
  late TextEditingController nameController;

  String? selectedYear;
  int? selectedDoctorId;
  List<String> selectedDepts = [];

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.subject.subjectName);

    selectedYear = widget.subject.academicYear;

    final doc = widget.doctors.firstWhere(
      (d) => d.doctorName == widget.subject.doctorName,
      orElse: () => GetDoctorData(),
    );

    selectedDoctorId = doc.doctorId;

    selectedDepts = widget.subject.departments != null
        ? List<String>.from(widget.subject.departments!)
        : [];
  }

  bool get isFourthYear => selectedYear == "Fourth Year";
  bool get isDeptInvalid => isFourthYear && selectedDepts.isEmpty;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Subject"),
      content: SingleChildScrollView(
        child: Form(
          key: widget.viewModel.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// NAME
              TextFormField(
                controller: nameController,
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Required field'
                    : null,
                decoration: const InputDecoration(labelText: "Subject Name"),
              ),

              const SizedBox(height: 12),

              /// DOCTOR
              DropdownButtonFormField<int>(
                value: selectedDoctorId,
                items: widget.doctors
                    .map(
                      (doc) => DropdownMenuItem(
                        value: doc.doctorId,
                        child: Text(doc.doctorName ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedDoctorId = val;
                  });
                },
                decoration: const InputDecoration(labelText: "Assign Doctor"),
              ),

              const SizedBox(height: 12),

              /// YEAR
              InputDecorator(
                decoration: const InputDecoration(labelText: "Year"),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedYear,
                    isExpanded: true,
                    items:
                        [
                              "First Year",
                              "Second Year",
                              "Third Year",
                              "Fourth Year",
                            ]
                            .map(
                              (y) => DropdownMenuItem(value: y, child: Text(y)),
                            )
                            .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedYear = val;

                        if (val != "Fourth Year") {
                          selectedDepts.clear();
                        }
                      });
                    },
                  ),
                ),
              ),

              /// DEPARTMENTS
              if (isFourthYear) ...[
                const SizedBox(height: 16),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Departments:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  children: widget.departmentViewModel.departmentNames.map((
                    dept,
                  ) {
                    final isSelected = selectedDepts.contains(dept);

                    return FilterChip(
                      label: Text(dept),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          value
                              ? selectedDepts.add(dept)
                              : selectedDepts.remove(dept);
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 8),

                if (selectedDepts.isEmpty)
                  Text(
                    "Please select at least one department",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
              ],
            ],
          ),
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        /// 🔥 SAVE BUTTON WITH LOADING
        BlocBuilder<SubjectViewModel, SubjectStates>(
          bloc: widget.viewModel,
          builder: (context, state) {
            final isLoading = state is UpdateCourseLoadingState;

            return ElevatedButton(
              onPressed: (isDeptInvalid || isLoading)
                  ? null
                  : () {
                      _onSave();
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text("Save"),
            );
          },
        ),
      ],
    );
  }

  void _onSave() {
    if (!(widget.viewModel.formKey.currentState?.validate() ?? false)) return;

    if (selectedDoctorId == null || selectedYear == null) {
      DialogUtils.showErrorDialog(context, 'Please fill all fields');
      return;
    }

    final originalDocId = widget.doctors
        .firstWhere(
          (d) => d.doctorName == widget.subject.doctorName,
          orElse: () => GetDoctorData(),
        )
        .doctorId;

    bool isNameChanged = nameController.text != widget.subject.subjectName;

    bool isDoctorChanged = selectedDoctorId != originalDocId;

    bool isYearChanged = selectedYear != widget.subject.academicYear;

    bool isDeptsChanged = !const ListEquality().equals(
      selectedDepts,
      widget.subject.departments ?? [],
    );

    if (!isNameChanged &&
        !isDoctorChanged &&
        !isYearChanged &&
        !isDeptsChanged) {
      DialogUtils.showErrorDialog(context, "Please change anything first");
      return;
    }

    final doctor = widget.doctors.firstWhere(
      (doc) => doc.doctorId == selectedDoctorId,
    );

    final request = UpdateCourseRequest(
      departments: selectedDepts,
      academicYear: selectedYear,
      id: widget.subject.id,
      doctorName: doctor.doctorName,
      name: nameController.text,
    );

    widget.viewModel.updateCourse(updateCourseRequest: request);
  }
}
