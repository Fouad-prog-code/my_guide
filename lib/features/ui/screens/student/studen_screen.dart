import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/config/di.dart';
import 'package:my_guide/domain/entities/response/lectures.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';
import 'package:my_guide/features/ui/screens/student/cubit/student_state_model.dart';
import 'package:my_guide/features/ui/screens/student/cubit/student_view_model.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

StudentViewModel studentViewModel = getIt<StudentViewModel>();

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      studentViewModel.getStudentSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    String? acYear = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.h,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(42.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lectures Schedule',
                style: AppStyles.regural24White.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                acYear,
                style: AppStyles.regural16White.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<StudentViewModel, StudentStates>(
        bloc: studentViewModel,
        builder: (context, state) {
          if (state is StudentErrorState) {
            return ErrorsWidget(
              message: state.errorMessage,
              onPressed: () {
                studentViewModel.getStudentSchedule();
              },
            );
          } else if (state is StudentSuccessState) {
            final data = state.studentScheduleResponse.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text('No Data Found', style: AppStyles.bold20primary),
              );
            }
            // Sort days: Saturday → Thursday
            const dayOrder = [
              'Saturday',
              'Sunday',
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
            ];
            final sortedData = List.of(data)
              ..sort((a, b) {
                final indexA = dayOrder.indexOf(a.dayOfWeek ?? '');
                final indexB = dayOrder.indexOf(b.dayOfWeek ?? '');
                return (indexA == -1 ? 999 : indexA).compareTo(
                  indexB == -1 ? 999 : indexB,
                );
              });

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 24.h),
              child: ListView.builder(
                itemCount: sortedData.length,
                itemBuilder: (context, index) {
                  final daySchedule = sortedData[index];
                  final dayName = daySchedule.dayOfWeek ?? '';
                  final studentLectures = daySchedule.lectures ?? [];

                  // Convert StudentLecture to Lectures for ScheduleDayWidget
                  final lectures = studentLectures
                      .map(
                        (sl) => Lectures(
                          subjectName: sl.subjectName,
                          lecturerName: sl.doctorName,
                          startTime: sl.startTime,
                          endTime: sl.endTime,
                        ),
                      )
                      .toList();

                  // Build room names list from student lectures
                  final roomNames = studentLectures
                      .map((sl) => sl.roomName ?? '')
                      .toList();

                  return ScheduleDayWidget(
                    day: dayName,
                    isStudent: true,
                    studentLectures: studentLectures,
                    numOfLectures: studentLectures.length,
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
