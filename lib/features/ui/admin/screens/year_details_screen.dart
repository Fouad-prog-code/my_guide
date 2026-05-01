import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_data.dart';
import 'package:my_guide/domain/entities/response/get_student/view_student_dots.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_states.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_view_model.dart';

class YearDetailsScreen extends StatefulWidget {
  final String title;
  final String yearName;
  final String deptName;
  final List<GetStudentData> allStudents;
  final StudentViewModel viewModel;

  const YearDetailsScreen({
    super.key,
    required this.title,
    required this.yearName,
    required this.deptName,
    required this.allStudents,
    required this.viewModel,
  });

  @override
  State<YearDetailsScreen> createState() => _YearDetailsScreenState();
}

class _YearDetailsScreenState extends State<YearDetailsScreen> {
  final List<String> departments = [
    'Computer Science',
    'Information Technology',
    'Network',
    'Information Systems',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentViewModel, StudentStates>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is UpdateStudentErrorState) {
          DialogUtils.showErrorDialog(context, state.message);
        } else if (state is UpdateStudentSuccessState) {
          Navigator.pop(context);
          widget.viewModel.getStudent();

          SnackBarUtils.showSuccessSnackBar(
            context,
            state.studentResponse.data ?? '',
          );
        }
      },
      builder: (context, state) {
        final currentStudentsData =
            widget.viewModel.getStudentResponse?.data ?? widget.allStudents;

        List<ViewStudentDots> filteredList = [];
        for (var yearData in currentStudentsData) {
          if (yearData.yearName == widget.yearName) {
            if (widget.deptName.isEmpty) {
              filteredList.addAll(yearData.viewStudentDtos ?? []);
            } else {
              filteredList.addAll(
                yearData.viewStudentDtos
                        ?.where((s) => s.departmentName == widget.deptName)
                        .toList() ??
                    [],
              );
            }
          }
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF5F7F9),
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            backgroundColor: Colors.blueGrey[900],
            foregroundColor: Colors.white,
          ),
          body: filteredList.isEmpty
              ? const Center(child: Text("No students here"))
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final student = filteredList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFECEFF1),
                          child: Icon(Icons.person, color: Colors.blueGrey),
                        ),
                        title: Text(
                          student.studentName ?? 'No Name',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("ID: ${student.userName ?? 'N/A'}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () =>
                                  _showEditDialog(student, widget.yearName),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                DialogUtils.showMessage(
                                  context: context,
                                  title: 'Confirm Delete',
                                  msg: 'Do you want to delete this student?',
                                  nagtActionName: 'Delete',
                                  postActionName: 'Cancel',
                                  nagtAction: () =>
                                      widget.viewModel.deleteStudent(
                                        id: student.studentId ?? 0,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }

  void _showEditDialog(ViewStudentDots student, String year) {
    final nameController = TextEditingController(text: student.studentName);
    final idController = TextEditingController(text: student.userName);
    final nationalIdController = TextEditingController(
      text: student.nationalId,
    );

    String? localYear = year;
    String? localDept = student.departmentName;

    showDialog(
      context: context,
      builder: (dialogContext) => BlocBuilder<StudentViewModel, StudentStates>(
        bloc: widget.viewModel,
        builder: (context, state) {
          bool isLoading = state is UpdateStudentLoadingState;

          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text("Edit Student Info"),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: idController,
                        decoration: const InputDecoration(
                          labelText: "User Name / ID",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: nationalIdController,
                        decoration: const InputDecoration(
                          labelText: "National ID",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),

                      // Year Dropdown
                      DropdownButtonFormField<String>(
                        value: localYear,
                        decoration: const InputDecoration(
                          labelText: "Select Year",
                          border: OutlineInputBorder(),
                        ),
                        items: widget.viewModel.yearsList
                            .map(
                              (y) => DropdownMenuItem(value: y, child: Text(y)),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            localYear = val;
                          });
                        },
                      ),

                      if (localYear == 'Fourth Year') ...[
                        const SizedBox(height: 15),
                        DropdownButtonFormField<String>(
                          value: localDept,
                          decoration: const InputDecoration(
                            labelText: "Select Department",
                            border: OutlineInputBorder(),
                          ),

                          items: departments
                              .map(
                                (d) =>
                                    DropdownMenuItem(value: d, child: Text(d)),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() => localDept = val);
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => Navigator.pop(dialogContext),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            bool isChanged =
                                (nameController.text != student.studentName ||
                                idController.text != student.userName ||
                                nationalIdController.text !=
                                    student.nationalId ||
                                localDept != student.departmentName ||
                                localYear != year);

                            if (!isChanged) {
                              DialogUtils.showErrorDialog(
                                context,

                                'Please change anything first',
                              );

                              return;
                            }

                            widget.viewModel.updateStudent(
                              id: student.studentId ?? 0,
                              fullName: nameController.text,
                              userName: idController.text,
                              nationalId: nationalIdController.text,
                              yearName: localYear ?? '',
                              deptName: localDept ?? '',
                            );
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
