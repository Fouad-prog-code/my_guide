import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/features/ui/admin/screens/group_time_table_screen.dart';
import 'package:my_guide/features/ui/admin/screens/tables_screen/cubit/tables_states.dart';
import 'package:my_guide/features/ui/admin/screens/tables_screen/cubit/tables_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  TablesViewModel tablesViewModel = getIt<TablesViewModel>();

  @override
  void initState() {
    super.initState();
    tablesViewModel.getYearTables();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<TablesViewModel, TablesStates>(
            bloc: tablesViewModel,
            builder: (context, state) {
              if (state is YearTablesErrorStates) {
                return ErrorsWidget(
                  message: state.message,
                  onPressed: () {
                    tablesViewModel.getYearTables();
                  },
                );
              } else if (state is YearTablesSuccessStates) {
                final data = state.yearTableResponse.data ?? [];

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "General Years",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final timetable = data[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          timetable.yearName ?? "Unknown Year",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            List<Map<String, dynamic>>
                                            gridData = [];
                                            if (timetable.schedules != null) {
                                              for (var schedule
                                                  in timetable.schedules!) {
                                                String day =
                                                    schedule.dayName ??
                                                    "Unknown";
                                                if (schedule.lectures != null) {
                                                  for (var lecture
                                                      in schedule.lectures!) {
                                                    String startTime =
                                                        lecture.startTime ?? "";
                                                    String endTime =
                                                        lecture.endTime ?? "";

                                                    gridData.add({
                                                      "day": day,
                                                      "startTime": startTime,
                                                      "endTime": endTime,
                                                      "subject":
                                                          lecture.courseName ??
                                                          "Unknown",
                                                      "doctorName":
                                                          lecture.doctorName ??
                                                          "Unknown",
                                                      "room":
                                                          lecture.roomName ??
                                                          "Unknown",
                                                    });
                                                  }
                                                }
                                              }
                                            }

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    GroupTimetableScreen(
                                                      data: {
                                                        timetable.yearName ??
                                                                "Timetable":
                                                            gridData,
                                                      },
                                                    ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.visibility),
                                          label: const Text("View"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Year: ${timetable.yearId ?? 'unkown'}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

          BlocBuilder<TablesViewModel, TablesStates>(
            bloc: tablesViewModel,
            builder: (context, state) {
              if (state is YearTablesErrorStates) {
                return ErrorsWidget(
                  message: state.message,
                  onPressed: () {
                    tablesViewModel.getYearTables();
                  },
                );
              } else if (state is YearTablesSuccessStates) {
                final data = state.yearTableResponse.data ?? [];

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Departments",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final timetable = data[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          timetable.yearName ?? "Unknown Year",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            List<Map<String, dynamic>>
                                            gridData = [];
                                            if (timetable.schedules != null) {
                                              for (var schedule
                                                  in timetable.schedules!) {
                                                String day =
                                                    schedule.dayName ??
                                                    "Unknown";
                                                if (schedule.lectures != null) {
                                                  for (var lecture
                                                      in schedule.lectures!) {
                                                    String startTime =
                                                        lecture.startTime ?? "";
                                                    String endTime =
                                                        lecture.endTime ?? "";

                                                    gridData.add({
                                                      "day": day,
                                                      "startTime": startTime,
                                                      "endTime": endTime,
                                                      "subject":
                                                          lecture.courseName ??
                                                          "Unknown",
                                                      "doctorName":
                                                          lecture.doctorName ??
                                                          "Unknown",
                                                      "room":
                                                          lecture.roomName ??
                                                          "Unknown",
                                                    });
                                                  }
                                                }
                                              }
                                            }

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    GroupTimetableScreen(
                                                      data: {
                                                        timetable.yearName ??
                                                                "Timetable":
                                                            gridData,
                                                      },
                                                    ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.visibility),
                                          label: const Text("View"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Year: ${timetable.yearId ?? 'unkown'}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
