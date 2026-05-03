import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/admin/screens/dashboard_screen/cubit/dashboard_states.dart';
import 'package:my_guide/features/ui/admin/screens/dashboard_screen/cubit/dashboard_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/generate_tables/cubit/generate_tables_states.dart';
import 'package:my_guide/features/ui/admin/screens/generate_tables/cubit/generate_tables_view_model.dart';
import 'package:my_guide/features/ui/admin/screens/tables_screen/tables_screen.dart';
import 'package:my_guide/features/ui/admin/widgets/admin_custom_text_form_field.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';
import 'package:my_guide/features/ui/admin/screens/group_time_table_screen.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class GenerateTimeTabelsScreen extends StatefulWidget {
  const GenerateTimeTabelsScreen({super.key});

  @override
  State<GenerateTimeTabelsScreen> createState() =>
      _GenerateTimeTabelsScreenState();
}

class _GenerateTimeTabelsScreenState extends State<GenerateTimeTabelsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  DashboardViewModel viewModel = getIt<DashboardViewModel>();
  GenerateTablesViewModel generateViewModel = getIt<GenerateTablesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getDashboard();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void _generateTimetables() {
  //   setState(() {
  //     _isGenerating = true;
  //   });

  // Future.delayed(const Duration(seconds: 2), () {
  //   final result = dataManager.generateTimetables();

  //   if (mounted) {
  //     setState(() {
  //       _isGenerating = false;
  //     });

  //       if (result.isEmpty) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text("Please add subjects before generating timetables"),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: Colors.blueGrey[900],
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.settings), text: "Generate"),
              Tab(icon: Icon(Icons.schedule), text: "View Timetables"),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildGenerateTab(), TablesScreen()],
      ),
    );
  }

  Widget _buildGenerateTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Generate Timetables",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Status cards
            BlocBuilder<DashboardViewModel, DashboardStates>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is DashboardErrorState) {
                  return ErrorsWidget(
                    message: state.message,
                    onPressed: () {
                      viewModel.getDashboard();
                    },
                  );
                } else if (state is DashboardSuccessState) {
                  final data = state.dashboardResponse.data;
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildStatusCard(
                        label: "Doctors",
                        count: data?.totalDoctors.toString() ?? '',
                        isComplete: data!.totalDoctors! > 0,
                      ),
                      _buildStatusCard(
                        label: "Subjects",
                        count: data.totalSubjects.toString(),
                        isComplete: data.totalSubjects! > 0,
                      ),
                      _buildStatusCard(
                        label: "Rooms",
                        count: data.totalRooms.toString(),
                        isComplete: data.totalRooms! > 0,
                      ),
                      _buildStatusCard(
                        label: "Groups",
                        count: data.totalGroups.toString(),
                        isComplete: data.totalGroups! > 0,
                      ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkGrayColor,
                  ),
                );
              },
            ),

            const SizedBox(height: 60),

            // Generate button
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Form(
                key: generateViewModel.formKey,
                child: Column(
                  children: [
                    AdminCustomTextFormField(
                      label: 'Start Time',
                      hintText: 'day start time',
                      controller: generateViewModel.startTimeController,
                      validator: (value) =>
                          AppValidators.validateTimeFormat(value),
                    ),
                    AdminCustomTextFormField(
                      label: 'End Time',
                      hintText: 'day end time',
                      controller: generateViewModel.endTimeController,
                      validator: (value) =>
                          AppValidators.validateTimeFormat(value),
                    ),
                    AdminCustomTextFormField(
                      label: 'lecture Duration',
                      hintText: 'lecture Duration Minutes',
                      keyboardType: TextInputType.number,
                      controller: generateViewModel.lectureDurationController,
                      validator: (value) =>
                          AppValidators.validateOnlyNumbers(value),
                    ),
                    AdminCustomTextFormField(
                      label: 'Lectures Per Doctor',
                      hintText: 'max Lectures Per Doctor Per Day',
                      keyboardType: TextInputType.number,
                      controller: generateViewModel.lecturesPerDoctorController,
                      validator: (value) =>
                          AppValidators.validateOnlyNumbers(value),
                    ),
                    AdminCustomTextFormField(
                      label: 'Lectures Per Year',
                      hintText: 'max Lectures Per Year Per Day',
                      keyboardType: TextInputType.number,
                      controller: generateViewModel.lecturesPerYearController,
                      validator: (value) =>
                          AppValidators.validateOnlyNumbers(value),
                    ),

                    Icon(
                      Icons.auto_awesome,
                      size: 80,
                      color: Colors.blueGrey[900],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Generate Timetables",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Create automatic schedules for all groups based on data",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child:
                          BlocConsumer<
                            GenerateTablesViewModel,
                            GenerateTablesStates
                          >(
                            bloc: generateViewModel,
                            listener: (context, state) {
                              if (state is GenerateTablesErrorStates) {
                                SnackBarUtils.showErrorSnackBar(
                                  context,
                                  state.message,
                                );
                              } else if (state is GenerateTablesSuccessStates) {
                                SharedPreferencesUtils.setData(
                                  key: 'schedulesId',
                                  value:
                                      state.generateTablesResponse.data ?? '',
                                );
                                SnackBarUtils.showSuccessSnackBar(
                                  context,
                                  state.generateTablesResponse.message ??
                                      'Success',
                                );
                              }
                            },
                            builder: (context, state) {
                              final isLoading =
                                  state is GenerateTablesLoadingStates;
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      12.r,
                                    ),
                                  ),
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (generateViewModel
                                            .formKey
                                            .currentState!
                                            .validate()) {
                                          DialogUtils.showMessage(
                                            context: context,
                                            title: 'Confirm Generate',
                                            msg:
                                                'Do you want to generate Schedules?',
                                            nagtActionName: 'Generate',
                                            postActionName: 'Cancel',

                                            nagtAction: () {
                                              Navigator.pop(context);
                                              generateViewModel
                                                  .generateTables();
                                            },
                                          );
                                        }
                                      },

                                child: isLoading
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.blueGrey[900],
                                        ),
                                      )
                                    : const Text(
                                        "Generate",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            },
                          ),
                    ),
                    // const SizedBox(height: 16),
                    // Text(
                    //   _getGenerateButtonStatus(),
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.grey[600],
                    //     fontStyle: FontStyle.italic,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({
    required String label,
    required String count,
    required bool isComplete,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isComplete ? Colors.green[50] : Colors.red[50],
        border: Border.all(
          color: isComplete ? Colors.green[300]! : Colors.red[300]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.cancel,
            color: isComplete ? Colors.green : Colors.red,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
