import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_states.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  SubjectViewModel viewModel = getIt<SubjectViewModel>();

  String formatDepartments(dynamic depts) {
    if (depts == null || (depts is List && depts.isEmpty)) return 'General';
    if (depts is List) return depts.join(' - ').toUpperCase();
    return depts.toString();
  }

  @override
  Widget build(BuildContext context) {
    final dataManager = DataManager();
    bool isMobile = MediaQuery.of(context).size.width < 700;

    final subjects = dataManager.subjects;
    final doctors = dataManager.doctors;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subjects Management",
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      _openSubjectDialog(context, doctors: doctors),
                  icon: const Icon(Icons.add),
                  label: Text(isMobile ? "Add" : "Add Subject"),
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
            Expanded(
              child: subjects.isEmpty
                  ? const Center(child: Text("No subjects added yet"))
                  : isMobile
                  ? _buildMobileList(context, subjects, doctors)
                  : _buildWebTable(context, subjects, doctors),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebTable(
    BuildContext context,
    List<Map<String, dynamic>> subjects,
    List<Map<String, dynamic>> doctors,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Subject Name")),
            DataColumn(label: Text("Doctor")),
            DataColumn(label: Text("Year")),
            DataColumn(label: Text("Departments")),
            DataColumn(label: Text("Actions")),
          ],
          rows: subjects.map((item) {
            final doctor = doctors.firstWhere(
              (d) => d['id'] == item['doctorId'],
              orElse: () => {'name': 'N/A'},
            );
            return DataRow(
              cells: [
                DataCell(Text(item['name'])),
                DataCell(Text(doctor['name'])),
                DataCell(Text(item['year'].toString())),
                DataCell(Text(formatDepartments(item['department']))),
                DataCell(_buildActions(context, item, doctors)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMobileList(
    BuildContext context,
    List<Map<String, dynamic>> subjects,
    List<Map<String, dynamic>> doctors,
  ) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final item = subjects[index];
        final doctor = doctors.firstWhere(
          (d) => d['id'] == item['doctorId'],
          orElse: () => {'name': 'N/A'},
        );
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Dr: ${doctor['name']}\nDepts: ${formatDepartments(item['department'])}",
            ),
            trailing: _buildActions(context, item, doctors),
          ),
        );
      },
    );
  }

  Widget _buildActions(
    BuildContext context,
    Map<String, dynamic> item,
    List<Map<String, dynamic>> doctors,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {},
        ),
      ],
    );
  }

  void _openSubjectDialog(
    BuildContext context, {
    Map<String, dynamic>? subject,
    required List<Map<String, dynamic>> doctors,
  }) {
    final nameController = TextEditingController(text: subject?['name'] ?? "");
    viewModel.selectedYear = subject?['year']?.toString();
    viewModel.selectedDoctorId = subject?['doctorId'];
    List<String> selectedDepts = subject?['department'] != null
        ? List<String>.from(subject!['department'])
        : [];

    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: viewModel,
        child: StatefulBuilder(
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
                      validator: (val) => (val == null || val.isEmpty)
                          ? 'Required field'
                          : null,
                      decoration: const InputDecoration(
                        labelText: "Subject Name",
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<int>(
                      value: viewModel.selectedDoctorId,
                      hint: const Text("Select Doctor"),
                      decoration: const InputDecoration(
                        labelText: "Assign Doctor",
                      ),
                      items: doctors
                          .map(
                            (doc) => DropdownMenuItem<int>(
                              value: doc['id'],
                              child: Text(doc['name']),
                            ),
                          )
                          .toList(),
                      onChanged: (val) => setDialogState(
                        () => viewModel.selectedDoctorId = val,
                      ),
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
                                (y) =>
                                    DropdownMenuItem(value: y, child: Text(y)),
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
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              BlocConsumer<SubjectViewModel, SubjectStates>(
                listener: (context, state) {
                  if (state is SubjectErrorState) {
                    DialogUtils.showErrorDialog(context, state.message);
                  }
                  if (state is SubjectSuccessState) {
                    Navigator.pop(dialogContext);
                    SnackBarUtils.showSuccessSnackBar(
                      context,
                      state.addSubjectResponse.data ?? '',
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is SubjectLoadingState;
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
                              (doc) => doc['id'] == viewModel.selectedDoctorId,
                            );
                            viewModel.addSubject(
                              token:
                                  await SharedPreferencesUtils.getData(
                                    key: 'token',
                                  ) ??
                                  '',
                              addSubjectRequest: AddSubjectRequest(
                                lectureName: nameController.text,
                                doctorName: doctor['name'],
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
      ),
    );
  }
}
