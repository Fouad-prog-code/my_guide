import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_guide/config/di.dart';

import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_data.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_states.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_states.dart';
import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/password_text_form_field.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  ManagerViewModel viewModel = getIt<ManagerViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ManagerViewModel, ManagerStates>(
        listener: (context, state) {
          if (state is AddManagerSuccessState) {
            // 1. نقفل الـ Dialog المفتوح
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            // 2. نحدث القائمة
            // viewModel.getDoctor();
            // 3. نظهر رسالة النجاح
            String msg = "Operation Successful";
            // if (state is DeleteRoomSuccessState) {
            //   msg = state.deleteRoomResponse.data ?? "Deleted";
            // }
            // if (state is UpdateDoctorSuccessState) {
            //   msg = state.updateDoctorResponse.data ?? "Updated";
            // }
            if (state is AddManagerSuccessState) {
              msg = state.addManagerResponse.message ?? '';
            }
            SnackBarUtils.showSuccessSnackBar(context, msg);
          }

          if (state is AddManagerErrorState) {
            String errorMsg = "";
            if (state is AddManagerErrorState) errorMsg = state.message;
            //if (state is UpdateDoctorErrorState) errorMsg = state.message;
            // if (state is DeleteRoomErrorState) errorMsg = state.message;

            DialogUtils.showErrorDialog(context, errorMsg);
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
                // Expanded(
                //   child: BlocBuilder<DoctorViewModel, DoctorStates>(
                //     builder: (context, state) {
                //       if (state is GetDoctorLoadingState) {
                //         return const Center(
                //           child: CircularProgressIndicator(
                //             color: AppColors.darkGrayColor,
                //           ),
                //         );
                //       }

                //       if (state is GetDoctorErrorState) {
                //         return Padding(
                //           padding: EdgeInsets.only(top: 200.h),
                //           child: ErrorsWidget(
                //             message: state.message,
                //             onPressed: () {
                //               viewModel.getDoctor();
                //             },
                //           ),
                //         );
                //       } else {
                //         var doctors = viewModel.getDoctorResponse?.data ?? [];

                //         return ListView.builder(
                //           itemCount: doctors.length,
                //           itemBuilder: (context, index) {
                //             final doctor = doctors[index];

                //             return Card(
                //               margin: const EdgeInsets.only(bottom: 12),
                //               child: ExpansionTile(
                //                 leading: const CircleAvatar(
                //                   child: Icon(Icons.person),
                //                 ),

                //                 title: Text(
                //                   doctor.doctorName ?? '',
                //                   style: const TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),

                //                 subtitle: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("ID: ${doctor.doctorId}"),
                //                     Row(
                //                       children: [
                //                         const Icon(Icons.menu_book, size: 16),
                //                         const SizedBox(width: 4),
                //                         Text(
                //                           "${doctor.lectures?.length ?? 0} lectures",
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),

                //                 /// ✔️ هنا الأكشنز لسه موجودة
                //                 trailing: Row(
                //                   mainAxisSize: MainAxisSize.min,
                //                   children: [
                //                     IconButton(
                //                       icon: const Icon(
                //                         Icons.edit,
                //                         color: Colors.blue,
                //                       ),
                //                       onPressed: () {
                //                         _showEditDialog(doctor);
                //                       },
                //                     ),
                //                     IconButton(
                //                       icon: const Icon(
                //                         Icons.delete_outline,
                //                         color: Colors.red,
                //                       ),
                //                       onPressed: () {
                //                         // delete doctor
                //                       },
                //                     ),
                //                   ],
                //                 ),

                //                 children: [
                //                   if (doctor.lectures == null ||
                //                       doctor.lectures!.isEmpty)
                //                     const Padding(
                //                       padding: EdgeInsets.all(12),
                //                       child: Text(
                //                         "No lectures assigned",
                //                         style: TextStyle(color: Colors.grey),
                //                       ),
                //                     )
                //                   else
                //                     Padding(
                //                       padding: const EdgeInsets.only(
                //                         left: 16,
                //                         right: 16,
                //                         bottom: 12,
                //                       ),
                //                       child: Wrap(
                //                         spacing: 8,
                //                         runSpacing: 8,
                //                         children: doctor.lectures!
                //                             .map(
                //                               (lec) => Chip(
                //                                 label: Text(lec),
                //                                 backgroundColor:
                //                                     Colors.blueGrey.shade50,
                //                               ),
                //                             )
                //                             .toList(),
                //                       ),
                //                     ),
                //                 ],
                //               ),
                //             );
                //           },
                //         );
                //       }
                //     },
                //   ),
                // ),
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

  void _showEditDialog(GetDoctorData doctor) {
    final fullNameController = TextEditingController(text: doctor.doctorName);
    // final userNameController = TextEditingController(text: doctor.);
    // final nationalIdController = TextEditingController(text:doctor. );
    final idController = TextEditingController(
      text: doctor.doctorId.toString(),
    );
    // final passwordController = TextEditingController(
    //   text:doctor. ,
    // );
    final GlobalKey<FormState> editFormKey = GlobalKey();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Room Info"),
        content: Form(
          key: editFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              // TextFormField(
              //   controller: userNameController,
              //   decoration: const InputDecoration(labelText: "User Name"),
              //   validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              // ),
              // const SizedBox(height: 10),
              // TextFormField(
              //   controller: nationalIdController,
              //   decoration: const InputDecoration(labelText: "NationalId"),
              //   keyboardType: TextInputType.number,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   validator: (v) =>
              //       (v == null || !RegExp(r'^[0-9]+$').hasMatch(v.trim()))
              //       ? 'Enter numbers only'
              //       : null,
              // ),
              // const SizedBox(height: 10),
              // TextFormField(
              //   controller: passwordController,
              //   decoration: const InputDecoration(labelText: "Password"),
              //   validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              // ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<DoctorViewModel, DoctorStates>(
            // bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is UpdateDoctorLoadingState;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        bool isChanged =
                            fullNameController.text != doctor.doctorName;
                        //||
                        // locationController.text != room.location ||
                        // capacityController.text != room.capacity.toString();

                        if (!isChanged) {
                          DialogUtils.showErrorDialog(
                            context,
                            'Please change anything first',
                          );
                          return;
                        }

                        if (editFormKey.currentState!.validate()) {
                          // viewModel.updateDoctor(
                          //   updateRoomRequest: UpdateRoomRequest(
                          //     roomId: room.roomId ?? 0,
                          //     roomName: nameController.text,
                          //     capacity: int.parse(capacityController.text),
                          //     location: locationController.text,
                          //   ),
                          // );
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
