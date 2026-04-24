import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_data.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_states.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/year_details_screen.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  StudentViewModel viewModel = getIt<StudentViewModel>();

  final List<String> basicYears = ['First Year', 'Second Year', 'Third Year'];
  final List<String> departments = [
    'Computer Science',
    'Information Technology',
    'Network',
    'Information Systems',
  ];

  @override
  void initState() {
    super.initState();
    viewModel.getStudent();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<StudentViewModel, StudentStates>(
        listener: (context, state) {
          if (state is AddStudentSuccessState) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            viewModel.getStudent();
            SnackBarUtils.showSuccessSnackBar(
              context,
              state.addUserResponse.message ?? 'Added successfully',
            );
          }

          if (state is DeleteStudentSuccessState) {
            Navigator.pop(context);
            viewModel.getStudent();
            SnackBarUtils.showSuccessSnackBar(
              context,
              state.studentResponse.data ?? "Deleted successfully",
            );
          }

          if (state is AddStudentErrorState ||
              state is DeleteStudentErrorState) {
            String errorMsg = "";
            if (state is AddStudentErrorState) errorMsg = state.message;
            if (state is DeleteStudentErrorState) errorMsg = state.message;

            DialogUtils.showErrorDialog(context, errorMsg);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F7F9),
          appBar: AppBar(
            title: const Text("Students Management"),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.5,
          ),
          body: BlocBuilder<StudentViewModel, StudentStates>(
            builder: (context, state) {
              if (state is GetStudentLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkGrayColor,
                  ),
                );
              } else if (state is GetStudentErrorState) {
                return Padding(
                  padding: EdgeInsets.only(top: 250.h),
                  child: ErrorsWidget(
                    message: state.message,
                    onPressed: () {
                      viewModel.getStudent();
                    },
                  ),
                );
              }

              final studentsData = viewModel.getStudentResponse?.data ?? [];

              return Padding(
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
                      displayName = departments[index - basicYears.length];
                      filterYear = 'Fourth Year';
                      filterDept = departments[index - basicYears.length];
                    }

                    int count = 0;
                    for (var year in studentsData) {
                      if (year.yearName == filterYear) {
                        if (!isDept) {
                          count += year.viewStudentDtos?.length ?? 0;
                        } else {
                          count +=
                              year.viewStudentDtos
                                  ?.where((s) => s.departmentName == filterDept)
                                  .length ??
                              0;
                        }
                      }
                    }

                    return _buildCategoryCard(
                      displayName,
                      count,
                      filterYear,
                      filterDept,
                      studentsData,
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showAddStudentDialog(context),
            backgroundColor: Colors.blueGrey[900],
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    int count,
    String year,
    String dept,
    List<GetStudentData> currentList,
  ) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YearDetailsScreen(
              title: title,
              yearName: year,
              deptName: dept,
              allStudents: currentList,
              viewModel: viewModel,
            ),
          ),
        );
        viewModel.getStudent();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
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
            BlocBuilder<StudentViewModel, StudentStates>(
              bloc: viewModel,

              builder: (context, state) {
                isLoading = state is AddStudentLoadingState;
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
