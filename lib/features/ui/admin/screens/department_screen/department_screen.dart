import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/utils/app_colors.dart';

import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_data.dart';

import 'package:my_guide/features/ui/admin/screens/department_screen/cubit/department_states.dart';
import 'package:my_guide/features/ui/admin/screens/department_screen/cubit/department_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  DepartmentViewModel viewModel = getIt<DepartmentViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getDepartment();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<DepartmentViewModel, DepartmentStates>(
        listener: (context, state) {
          if (state is AddDepartmentSuccessState ||
              state is UpdateDepartmentSuccessState
          //     ||state is DeleteRoomSuccessState
          ) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }

            viewModel.getDepartment();

            String msg = "Operation Successful";
            // if (state is DeleteRoomSuccessState) {
            //   msg = state.deleteRoomResponse.data ?? "Deleted";
            //   DialogUtils.showMessage(
            //     context: context,
            //     msg: msg,
            //     title: state.deleteRoomResponse.message,
            //     nagtActionName: 'Ok',
            //     nagtAction: () {
            //       Navigator.pop(context);
            //     },
            //   );
            // }
            if (state is UpdateDepartmentSuccessState) {
              msg = state.updateDepartmentResponse.data ?? "Updated";
              SnackBarUtils.showSuccessSnackBar(context, msg);
            }
            if (state is AddDepartmentSuccessState) {
              viewModel.deptCodeController.clear();
              viewModel.deptNameController.clear();
              msg = state.addDepartmentResponse.data ?? '';
              SnackBarUtils.showSuccessSnackBar(context, msg);
            }
          }

          if (state is AddDepartmentErrorState ||
              state is UpdateDepartmentErrorState
          //||
          //     state is DeleteRoomErrorState
          ) {
            String errorMsg = "";
            if (state is AddDepartmentErrorState) errorMsg = state.errorMessage;
            if (state is UpdateDepartmentErrorState)
              errorMsg = state.errorMessage;
            //if (state is DeleteRoomErrorState) errorMsg = state.message;
            // Navigator.pop(context);
            DialogUtils.showErrorDialog(context, errorMsg);
          }

          // if (state is DeleteRoomLoadingState) {
          //   Navigator.pop(context);
          //   DialogUtils.showLoading(context: context, message: 'Deleting...');
          // }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F7F9),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// HEADER
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Departments Management",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed: () => showAddDepartmentDialog(context),
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // LIST
                Expanded(
                  child: BlocBuilder<DepartmentViewModel, DepartmentStates>(
                    builder: (context, state) {
                      if (state is GetDepartmentLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.darkGrayColor,
                          ),
                        );
                      }
                      if (state is GetDepartmentErrorState) {
                        return Padding(
                          padding: EdgeInsets.only(top: 70.h),
                          child: ErrorsWidget(
                            message: state.errorMessage,
                            onPressed: viewModel.getDepartment(),
                          ),
                        );
                      }

                      var departments =
                          viewModel.getDepartmentResponse?.data ?? [];
                      if (departments.isEmpty) {
                        return const Center(
                          child: Text("No Departments Found"),
                        );
                      }
                      return ListView.builder(
                        itemCount: departments.length,
                        itemBuilder: (context, index) {
                          final department = departments[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.meeting_room),
                              ),
                              title: Text(
                                department.departmentName ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "Code: ${department.departmentCode}",
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () =>
                                        _showEditDialog(department),
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
                                        msg:
                                            'Do you want to delete this department?',
                                        nagtActionName: 'Delete',
                                        postActionName: 'Cancel',
                                        // nagtAction: () => viewModel.deleteRoom(
                                        //   id: room.roomId ?? 0,
                                        // ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAddDepartmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Department"),
        content: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: viewModel.deptNameController,
                decoration: const InputDecoration(labelText: "Department Name"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              ),

              TextFormField(
                controller: viewModel.deptCodeController,

                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: "Department Code"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<DepartmentViewModel, DepartmentStates>(
            bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is AddDepartmentLoadingState;
              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        viewModel.addDepartment();
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Add"),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showEditDialog(GetDepartmentData department) {
    final nameController = TextEditingController(
      text: department.departmentName,
    );
    final codeController = TextEditingController(
      text: department.departmentCode,
    );

    final GlobalKey<FormState> editFormKey = GlobalKey();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Department Info"),
        content: Form(
          key: editFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Department Name"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: codeController,
                decoration: const InputDecoration(labelText: "Department Code"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<DepartmentViewModel, DepartmentStates>(
            bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is UpdateDepartmentLoadingState;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        bool isChanged =
                            nameController.text != department.departmentName ||
                            codeController.text != department.departmentCode;

                        if (!isChanged) {
                          DialogUtils.showErrorDialog(
                            context,
                            'Please change anything first',
                          );
                          return;
                        }

                        if (editFormKey.currentState!.validate()) {
                          UpdateDepartmentRequest updateDepartmentRequest =
                              UpdateDepartmentRequest(
                                departmentCode: codeController.text,
                                departmentName: nameController.text,
                                departmentId: department.departmentId,
                              );

                          viewModel.updateDepartment(
                            updateDepartmentRequest: updateDepartmentRequest,
                          );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
