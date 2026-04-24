import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // أضفنا المكتبة دي
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_data.dart';
import 'package:my_guide/domain/entities/response/get_student/view_student.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentViewModel, StudentStates>(
      bloc: widget.viewModel,
      builder: (context, state) {
        final currentStudentsData =
            widget.viewModel.getStudentResponse?.data ?? widget.allStudents;

        List<ViewStudent> filteredList = [];
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
                              onPressed: () => _showEditDialog(student),
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
                                  msg: 'Do you want to delete this room?',
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

  void _showEditDialog(ViewStudent student) {
    final nameController = TextEditingController(text: student.studentName);

    final idController = TextEditingController(text: student.userName);

    showDialog(
      context: context,

      builder: (context) => AlertDialog(
        title: const Text("Edit Student Info"),

        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(labelText: "Full Name"),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: idController,

              decoration: const InputDecoration(labelText: "User Name / ID"),

              keyboardType: TextInputType.number,
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),

            child: const Text("Cancel"),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),

            onPressed: () {},

            child: const Text(
              "Save Changes",

              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
