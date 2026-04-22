import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_states.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final dataManager = DataManager();

  DoctorViewModel viewModel = getIt<DoctorViewModel>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9), // خلفية هادية ومريحة
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Header - استبدلنا الـ Row بـ ListTile عشان الـ Responsive
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Doctors Management",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //subtitle: const Text("Manage university faculty records"),
              trailing: ElevatedButton.icon(
                onPressed: () => showAddTeacherDialog(context),
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

            /// Doctors List - الحل الجذري للـ Overflow
            Expanded(
              child: dataManager.doctors.isEmpty
                  ? const Center(child: Text("No doctors added yet"))
                  : ListView.builder(
                      itemCount: dataManager.doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = dataManager.doctors[index];
                        return _buildDoctorItem(doctor);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorItem(Map<String, dynamic> doctor) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[50],
          child: const Icon(Icons.person, color: Colors.blueGrey),
        ),
        title: Text(
          doctor['name'].toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // عرض الـ ID والتخصص بشكل مرتب
        subtitle: Text("ID: ${doctor['id']} | ${doctor['specialization']}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // مهم جداً عشان الـ Overflow
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue, size: 22),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 22,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // --- Logic Add ---
  void showAddTeacherDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Doctor"),
        content: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: viewModel.userNameController,
                  decoration: const InputDecoration(labelText: "User Name"),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return AppValidators.validateUserName(userName: value);
                  },
                ),
                TextFormField(
                  controller: viewModel.passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return AppValidators.validateRegisterPassword(
                      password: value,
                    );
                  },
                ),
                TextFormField(
                  controller: viewModel.fullNameController,
                  decoration: const InputDecoration(labelText: "Full Name"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return AppValidators.validateFullName(fullName: value);
                  },
                ),
                TextFormField(
                  controller: viewModel.idController,
                  decoration: const InputDecoration(labelText: "ID"),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 14,
                  validator: (value) {
                    return AppValidators.validateNationalId(id: value);
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocConsumer<DoctorViewModel, DoctorStates>(
            bloc: viewModel,
            listener: (context, state) {
              if (state is DoctorErrorState) {
                DialogUtils.showErrorDialog(context, state.message);
              } else if (state is DoctorSuccessState) {
                Navigator.pop(context);

                SnackBarUtils.showSuccessSnackBar(
                  context,
                  state.addDoctorResponse.message ?? '',
                );

                viewModel.idController.clear();
                viewModel.userNameController.clear();
                viewModel.fullNameController.clear();
                viewModel.passwordController.clear();
              }
            },
            builder: (context, state) {
              isLoading = state is DoctorLoadingState;

              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        String? token = await SharedPreferencesUtils.getData(
                          key: 'token',
                        );

                        viewModel.addDoctor(token: token ?? '');
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
    );
  }

  // --- Logic Edit ---
  void showEditDoctorDialog(BuildContext context, Map<String, dynamic> doctor) {
    final nameController = TextEditingController(
      text: doctor['name'].toString(),
    );
    final idController = TextEditingController(text: doctor['id'].toString());
    final specController = TextEditingController(
      text: doctor['specialization'].toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Doctor"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "ID",
                enabled: false,
              ),
            ),
            TextField(
              controller: specController,
              decoration: const InputDecoration(labelText: "Specialization"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                doctor['name'] = nameController.text;
                doctor['specialization'] = specController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
