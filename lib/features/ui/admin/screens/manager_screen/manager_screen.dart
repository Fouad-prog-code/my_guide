import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/utils/app_colors.dart';

import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';

import 'package:my_guide/domain/entities/response/get_manager/get_manager_data.dart';

import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_states.dart';
import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_view_model.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';
import 'package:my_guide/features/ui/admin/widgets/password_text_form_field.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  ManagerViewModel viewModel = getIt<ManagerViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getManager();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ManagerViewModel, ManagerStates>(
        listener: (context, state) {
          if (state is AddManagerSuccessState ||
              state is UpdateManagerSuccessState ||
              state is DeleteManagerSuccessState) {
            // 1. نقفل الـ Dialog المفتوح
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            // 2. نحدث القائمة
            viewModel.getManager();
            // 3. نظهر رسالة النجاح
            String msg = "Operation Successful";
            if (state is AddManagerSuccessState) {
              msg = state.addManagerResponse.message ?? '';
            }
            if (state is UpdateManagerSuccessState) {
              msg = state.updateManagerResponse.data ?? '';
            }
            if (state is DeleteManagerSuccessState) {
              msg = state.deleteManagerResponse.data ?? '';
            }
            SnackBarUtils.showSuccessSnackBar(context, msg);
          }

          if (state is AddManagerErrorState ||
              state is UpdateManagerErrorState ||
              state is DeleteManagerErrorState) {
            String errorMsg = "";
            if (state is AddManagerErrorState) errorMsg = state.message;
            if (state is UpdateManagerErrorState) errorMsg = state.message;
            if (state is DeleteManagerErrorState) errorMsg = state.message;

            DialogUtils.showErrorDialog(context, errorMsg);
          }

          if (state is DeleteManagerLoadingState) {
            Navigator.pop(context);
            DialogUtils.showLoading(context: context, message: 'Deleting...');
          }
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
                    "Manager Management",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed: () => showAddManagerDialog(context),
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
                ),

                const SizedBox(height: 20),

                /// LIST
                Expanded(
                  child: BlocBuilder<ManagerViewModel, ManagerStates>(
                    builder: (context, state) {
                      if (state is GetManagerLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.darkGrayColor,
                          ),
                        );
                      }

                      if (state is GetManagerErrorState) {
                        return Center(
                          child: ErrorsWidget(
                            message: state.message,
                            onPressed: () {
                              viewModel.getManager();
                            },
                          ),
                        );
                      } else {
                        var managers =
                            viewModel.getManagerResponse?.data ??
                            viewModel.getManagerResponse?.value ??
                            [];

                        if (managers.isEmpty) {
                          return const Center(
                            child: Text("No managers found."),
                          );
                        }

                        return ListView.builder(
                          itemCount: managers.length,
                          itemBuilder: (context, index) {
                            final manager = managers[index];

                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFECEFF1),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                title: Text(
                                  manager.fullName ?? 'No Name',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "ID: ${manager.userName ?? 'N/A'}",
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),

                                      onPressed: () => _showEditDialog(manager),
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
                                              'Do you want to delete this manager?',
                                          nagtActionName: 'Delete',
                                          postActionName: 'Cancel',
                                          nagtAction: () {
                                            viewModel.deleteManager(
                                              managerId: manager.managerId ?? 0,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
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

  // ================= ADD DOCTOR =================
  void showAddManagerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Manager"),
        content: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: viewModel.userNameController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: "User Name"),
                  validator: (v) => AppValidators.validateUserName(userName: v),
                ),
                TextFormField(
                  controller: viewModel.fullNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: "Full Name"),
                  validator: (v) => AppValidators.validateFullName(fullName: v),
                ),
                TextFormField(
                  controller: viewModel.idController,
                  maxLength: 14,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: "National ID"),
                  validator: (v) => AppValidators.validateNationalId(id: v),
                ),
                PasswordTextFormField(controller: viewModel.passwordController),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          BlocBuilder<ManagerViewModel, ManagerStates>(
            bloc: viewModel,

            builder: (context, state) {
              final isLoading = state is AddManagerLoadingState;

              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        viewModel.addManager();
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

  void _showEditDialog(GetManagerData manager) {
    final fullNameController = TextEditingController(text: manager.fullName);
    final userNameController = TextEditingController(text: manager.userName);
    final nationalIdController = TextEditingController(
      text: manager.nationalId,
    );

    final GlobalKey<FormState> editFormKey = GlobalKey();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Manager Info"),
        content: Form(
          key: editFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (v) => AppValidators.validateFullName(fullName: v),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(labelText: "User Name"),
                validator: (v) => AppValidators.validateUserName(userName: v),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nationalIdController,
                maxLength: 14,
                decoration: const InputDecoration(labelText: "NationalId"),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => AppValidators.validateNationalId(id: v),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<ManagerViewModel, ManagerStates>(
            bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is UpdateManagerLoadingState;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        bool isChanged =
                            fullNameController.text != manager.fullName ||
                            userNameController.text != manager.userName ||
                            nationalIdController.text != manager.nationalId;

                        if (!isChanged) {
                          DialogUtils.showErrorDialog(
                            context,
                            'Please change anything first',
                          );
                          return;
                        }

                        if (editFormKey.currentState!.validate()) {
                          viewModel.updateManager(
                            updateManagerRequest: UpdateManagerRequest(
                              managerId: manager.managerId ?? 0,
                              fullName: fullNameController.text,
                              userName: userNameController.text,
                              nationalId: nationalIdController.text,
                            ),
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
