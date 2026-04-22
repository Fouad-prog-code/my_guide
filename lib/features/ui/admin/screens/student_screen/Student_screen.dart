import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_states.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/year_details_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  // القائمة الأساسية للبيانات
  List<Map<String, dynamic>> studentsList = [
    {
      'name': 'Fouad Fawzy',
      'userName': '12345678',
      'department': 'CS',
      'year': 'Fourth Year',
    },
    {
      'name': 'Ahmed Mohamed',
      'userName': '87654321',
      'department': '',
      'year': 'Second Year',
    },
  ];

  final List<String> basicYears = ['First Year', 'Second Year', 'Third Year'];
  final List<String> departments = [
    'Computer Science',
    'Information Technology',
    'Network',
    'Information Systems',
  ];

  StudentViewModel viewModel = getIt<StudentViewModel>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        title: const Text("Students Management"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemCount: basicYears.length + departments.length,
          itemBuilder: (context, index) {
            String displayName;
            String filterYear;
            String filterDept = '';
            bool isDept = index >= basicYears.length;

            if (!isDept) {
              displayName = basicYears[index];
              filterYear = basicYears[index];
            } else {
              displayName =
                  departments[index - basicYears.length]; // اسم القسم مباشرة
              filterYear = 'Fourth Year';
              filterDept = departments[index - basicYears.length];
            }

            final count = studentsList.where((s) {
              if (!isDept) return s['year'] == filterYear;
              return s['year'] == filterYear && s['department'] == filterDept;
            }).length;

            return _buildCategoryCard(
              displayName,
              count,
              filterYear,
              filterDept,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddStudentDialog(context),
        backgroundColor: Colors.blueGrey[900],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryCard(String title, int count, String year, String dept) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YearDetailsScreen(
              title: title,
              yearName: year,
              deptName: dept,
              allStudents: studentsList,
            ),
          ),
        );
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_shared,
              size: 35,
              color: dept.isEmpty ? Colors.blueGrey : Colors.blue[800],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 5),
            Text(
              "$count Students",
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  // --- Logic Add المرجع كما هو من كودك بالضبط ---
  void showAddStudentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text("Add New Student"),
          content: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: viewModel.userNameController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "User Name"),
                    validator: (value) =>
                        AppValidators.validateUserName(userName: value),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: viewModel.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) =>
                        AppValidators.validateRegisterPassword(password: value),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: viewModel.fullNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "Full Name"),
                    validator: (value) =>
                        AppValidators.validateFullName(fullName: value),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: viewModel.idController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: const InputDecoration(
                      labelText: "ID",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 14,
                    validator: (value) =>
                        AppValidators.validateNationalId(id: value),
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    value: viewModel.selectedYear,
                    decoration: const InputDecoration(
                      labelText: "Select Year",
                      border: OutlineInputBorder(),
                    ),
                    items: viewModel.yearsList
                        .map(
                          (year) =>
                              DropdownMenuItem(value: year, child: Text(year)),
                        )
                        .toList(),
                    onChanged: (val) {
                      setDialogState(() {
                        viewModel.selectedYear = val;
                        if (viewModel.selectedYear != 'Fourth Year') {
                          viewModel.selectedDept = null;
                        }
                      });
                    },
                    validator: (val) => val == null ? "Required" : null,
                  ),
                  if (viewModel.selectedYear == 'Fourth Year') ...[
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: viewModel.selectedDept,
                      decoration: const InputDecoration(
                        labelText: "Select Department",
                        border: OutlineInputBorder(),
                      ),
                      items: departments
                          .map(
                            (dept) => DropdownMenuItem(
                              value: dept,
                              child: Text(dept),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setDialogState(() => viewModel.selectedDept = val);
                      },
                      validator: (val) =>
                          (viewModel.selectedYear == 'Fourth Year' &&
                              val == null)
                          ? "Please select a department"
                          : null,
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
            BlocConsumer<StudentViewModel, StudentStates>(
              bloc: viewModel,
              listener: (context, state) {
                if (state is StudentErrorState) {
                  DialogUtils.showErrorDialog(context, state.message);
                } else if (state is StudentSuccessState) {
                  Navigator.pop(context);
                  SnackBarUtils.showSuccessSnackBar(
                    context,
                    state.addUserResponse.message ?? "",
                  );

                  viewModel.fullNameController.clear();
                  viewModel.passwordController.clear();
                  viewModel.userNameController.clear();
                  viewModel.idController.clear();
                }
              },
              builder: (context, state) {
                isLoading = state is StudentLoadingState;
                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          String? token = await SharedPreferencesUtils.getData(
                            key: 'token',
                          );

                          viewModel.addStudent(token: token ?? "");
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Add"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
