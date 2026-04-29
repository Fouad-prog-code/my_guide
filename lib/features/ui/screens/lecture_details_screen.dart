import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_lectures.dart';
import 'package:my_guide/domain/entities/response/student_lecture.dart';
import 'package:my_guide/features/ui/widgets/build_detail_row.dart';
import 'package:my_guide/features/ui/widgets/build_divider.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};

    final dynamic lectureData = args['lecture'];

    DoctorLectures? doctorLecture;
    StudentLecture? studentLecture;

    if (lectureData is DoctorLectures) {
      doctorLecture = lectureData;
    } else if (lectureData is StudentLecture) {
      studentLecture = lectureData;
    }

    final String day = args['day'] ?? '';
    final bool isStudent = args['isStudent'] ?? false;

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
                      value:
                          doctorLecture?.courseName ?? studentLecture?.subjectName ?? 'Unknown',
                    ),
                    BuildDivider(),
                    isStudent
                        ? BuildDetailRow(
                            icon: Icons.person,
                            label: 'Doctor',
                            value: studentLecture?.doctorName ?? 'Unknown',
                          )
                        : BuildDetailRow(
                            icon: Icons.bar_chart_rounded,
                            label: 'Grade',
                            value: doctorLecture?.gradeName ?? 'Unknown',
                          ),
                    BuildDivider(),
                    BuildDetailRow(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: doctorLecture?.roomName ?? studentLecture?.roomName ?? 'Unknown',
                    ),
                    BuildDivider(),
                    BuildDetailRow(
                      icon: Icons.access_time_outlined,
                      label: 'Time',
                      value:
                          '$day ➡️ ${doctorLecture?.startTime ?? studentLecture?.startTime ?? ''} : ${doctorLecture?.endTime ?? studentLecture?.endTime ?? ''}',
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
