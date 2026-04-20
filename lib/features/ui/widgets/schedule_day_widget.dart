import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_lectures.dart';
import 'package:my_guide/features/ui/widgets/lecture_info_widget.dart';

// ignore: must_be_immutable
class ScheduleDayWidget extends StatelessWidget {
  ScheduleDayWidget({
    super.key,
    required this.day,
    required this.numOfLectures,
    required this.isStudent,
    required this.lectures,
  });

  final String day;
  final int numOfLectures;
  bool isStudent;

  List<DoctorLectures> lectures;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Row(
              children: [
                Container(
                  width: 5.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  day,
                  style: AppStyles.bold24Black.copyWith(fontSize: 20.sp),
                ),
                const Spacer(),
                Text(
                  numOfLectures > 1
                      ? '$numOfLectures Lectures'
                      : '$numOfLectures Lecture',
                  style: AppStyles.regural16White.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numOfLectures,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(height: 1, color: Colors.grey.shade200),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.lectureDetailsRoute,
                    arguments: {
                      'lecture': lectures[index],
                      'day': day,
                      'isStudent': isStudent,
                    },
                  );
                },
                child: LectureInfoWidget(
                  time: lectures[index].startTime ?? '',
                  location: lectures[index].roomName ?? '',
                  lectureName: lectures[index].courseName ?? '',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
