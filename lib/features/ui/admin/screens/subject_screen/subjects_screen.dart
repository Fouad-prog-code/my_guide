import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_data.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_states.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  SubjectViewModel viewModel = getIt<SubjectViewModel>();

  DoctorViewModel doctorViewModel = getIt<DoctorViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSubject();
    doctorViewModel.getDoctor();
  }

  @override
  Widget build(BuildContext context) {
    //  final List<Map<String, dynamic>> doctors = DataManager().doctors;

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<SubjectViewModel, SubjectStates>(
        listener: (context, state) {
          if (state is AddSubjectSuccessState ||
              // state is UpdateRoomSuccessState ||
              state is DeleteSubjectSuccessState) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }

            viewModel.getSubject();

            String msg = "Operation Successful";
            if (state is DeleteSubjectSuccessState) {
              msg = state.deleteSubjectResponse.data ?? "Deleted";
            }
            // if (state is UpdateRoomSuccessState) {
            //   msg = state.updateRoomResponse.data ?? "Updated";
            // }
            if (state is AddSubjectSuccessState) {
              msg = state.addSubjectResponse.data ?? '';
            }
            SnackBarUtils.showSuccessSnackBar(context, msg);
          }

          if (state is AddSubjectErrorState ||
              //state is UpdateRoomErrorState ||
              state is DeleteSubjectErrorState) {
            String errorMsg = "";
            if (state is AddSubjectErrorState)
              errorMsg = state.addSubjectmessage;
            // if (state is UpdateRoomErrorState) errorMsg = state.message;
            if (state is DeleteSubjectErrorState) errorMsg = state.message;

            DialogUtils.showErrorDialog(context, errorMsg);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subjects Management",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _openSubjectDialog(
                        context,
                        doctors: doctorViewModel.allDoctors,
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// LIST
                BlocBuilder<SubjectViewModel, SubjectStates>(
                  builder: (context, state) {
                    if (state is GetSubjectErrorState) {
                      return Padding(
                        padding: EdgeInsets.only(top: 250.h),
                        child: ErrorsWidget(
                          message: state.getSubjectmessage,
                          onPressed: () {
                            viewModel.getSubject();
                          },
                        ),
                      );
                    } else if (state is GetSubjectLoadingState) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 300.h),
                          child: CircularProgressIndicator(
                            color: AppColors.darkGrayColor,
                          ),
                        ),
                      );
                    } else {
                      var subjects = viewModel.getSubjectResponse?.data ?? [];

                      return subjects.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 250.h),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "No subjects added yet",
                                  style: AppStyles.bold22DarkGray,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: subjects.length,
                                itemBuilder: (_, index) {
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    child: ListTile(
                                      title: Text(
                                        subjects[index].subjectName ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Dr: ${subjects[index].doctorName}\n"
                                        "Depts: ${(subjects[index].departments as List).join(", ")}",
                                      ),
                                      trailing: _buildActions(
                                        name: subjects[index].subjectName ?? '',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ================= ACTIONS =================
  Widget _buildActions({required String name}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {
            DialogUtils.showMessage(
              context: context,
              title: 'Confirm Delete',
              msg: 'Do you want to delete this Course?',
              nagtActionName: 'Delete',
              postActionName: 'Cancel',
              nagtAction: () => viewModel.deleteSubject(name: name),
            );
          },
        ),
      ],
    );
  }

  /// ================= DIALOG =================
  void _openSubjectDialog(
    BuildContext context, {
    Map<String, dynamic>? subject,
    required List<GetDoctorData> doctors,
  }) {
    final nameController = TextEditingController(text: subject?['name'] ?? "");
    viewModel.selectedYear = subject?['year']?.toString();
    viewModel.selectedDoctorId = subject?['doctorId'];
    List<String> selectedDepts = subject?['department'] != null
        ? List<String>.from(subject!['department'])
        : [];
    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(subject == null ? "Add New Subject" : "Edit Subject"),
          content: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: (val) =>
                        (val == null || val.isEmpty) ? 'Required field' : null,
                    decoration: const InputDecoration(
                      labelText: "Subject Name",
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<int>(
                    value: viewModel.selectedDoctorId,
                    hint: const Text("Select Doctor"),

                    borderRadius: BorderRadius.circular(18.r),

                    decoration: InputDecoration(labelText: "Assign Doctor"),
                    items: doctors
                        .map(
                          (doc) => DropdownMenuItem<int>(
                            value: doc.doctorId,
                            child: Text(doc.doctorName ?? ''),
                          ),
                        )
                        .toList(),
                    onChanged: (val) =>
                        setDialogState(() => viewModel.selectedDoctorId = val),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: viewModel.selectedYear,
                    decoration: const InputDecoration(labelText: "Year"),
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
                      setDialogState(() {
                        viewModel.selectedYear = val;
                        if (val != "Fourth Year") selectedDepts.clear();
                      });
                    },
                  ),
                  if (viewModel.selectedYear == "Fourth Year") ...[
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
                      children:
                          [
                            "Computer Science",
                            "Information Technology",
                            "Information Systems",
                            "Network",
                          ].map((dept) {
                            final isSelected = selectedDepts.contains(dept);
                            return FilterChip(
                              label: Text(dept),
                              selected: isSelected,
                              selectedColor: Colors.blueGrey[100],
                              onSelected: (bool value) {
                                setDialogState(() {
                                  value
                                      ? selectedDepts.add(dept)
                                      : selectedDepts.remove(dept);
                                });
                              },
                            );
                          }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            BlocBuilder<SubjectViewModel, SubjectStates>(
              bloc: viewModel,

              builder: (context, state) {
                final isLoading = state is AddSubjectLoadingState;
                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (viewModel.selectedDoctorId == null ||
                              viewModel.selectedYear == null) {
                            DialogUtils.showErrorDialog(
                              context,
                              'Please fill all fields',
                            );
                            return;
                          }
                          if (viewModel.selectedYear == "Fourth Year" &&
                              selectedDepts.isEmpty) {
                            DialogUtils.showErrorDialog(
                              context,
                              'Please select at least one department',
                            );
                            return;
                          }
                          final doctor = doctors.firstWhere(
                            (doc) => doc.doctorId == viewModel.selectedDoctorId,
                          );
                          viewModel.addSubject(
                            token:
                                await SharedPreferencesUtils.getData(
                                  key: 'token',
                                ) ??
                                '',
                            addSubjectRequest: AddSubjectRequest(
                              lectureName: nameController.text,
                              doctorName: doctor.doctorName,
                              yearName: viewModel.selectedYear,
                              departmentNames: selectedDepts,
                            ),
                          );
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Save"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
