import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/core/utils/app_colors.dart';

import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_lectures.dart';
import 'package:my_guide/features/ui/widgets/build_detail_row.dart';
import 'package:my_guide/features/ui/widgets/build_divider.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};

    DoctorLectures lecture = args['lecture'];
    String day = args['day'];
    bool isStudent = args['isStudent'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: 80.h,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        title: Text('Lecture Details', style: AppStyles.blod24White),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.dg),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Card(
              elevation: 5,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  children: [
                    BuildDetailRow(
                      icon: Icons.school,
                      label: 'Course Name',
                      value: lecture.courseName ?? '',
                    ),
                    BuildDivider(),
                    isStudent
                        ? BuildDetailRow(
                            icon: Icons.person,
                            label: 'Doctor',
                            value: 'Dr. Ahmed Mohamed',
                          )
                        : BuildDetailRow(
                            icon: Icons.bar_chart_rounded,
                            label: 'Grade',
                            value: lecture.gradeName ?? '',
                          ),
                    BuildDivider(),
                    BuildDetailRow(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: lecture.roomName ?? '',
                    ),
                    BuildDivider(),
                    BuildDetailRow(
                      icon: Icons.access_time_outlined,
                      label: 'Time',
                      value:
                          '$day ➡️ ${lecture.startTime} : ${lecture.endTime}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
