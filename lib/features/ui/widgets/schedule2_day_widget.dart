import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/domain/entities/response/lectures.dart';
import 'package:my_guide/features/ui/widgets/room_manager_info_widget.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

// ignore: must_be_immutable
class Schedule2DayWidget extends StatelessWidget {
  Schedule2DayWidget({
    super.key,
    required this.day,
    required this.isStudent,
    this.docName = '',
    this.roomName = '',
    this.roomNames,
    this.subtitle,
    required this.lectures,
  });
  final String docName;
  final String roomName;

  /// Per-lecture room names (used when lectures come from different rooms, e.g. grouped by day)
  final List<String>? roomNames;
  final String day;

  /// Optional subtitle displayed on the opposite side of the header (e.g. day name)
  final String? subtitle;
  bool isStudent;
  final List<Lectures> lectures;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
              color: AppColors.primaryColor.withValues(alpha: 0.08),
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
                if (subtitle != null && subtitle!.isNotEmpty)
                  Text(
                    subtitle!,
                    style: AppStyles.bold24Black.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),

          // Iterate over lectures with their own index
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lectures.length,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(height: 1, color: Colors.grey.shade200),
            ),
            itemBuilder: (context, lectureIndex) {
              final lecture = lectures[lectureIndex];
              // Use per-lecture room name if available, otherwise fall back to single roomName
              final lectureRoomName =
                  (roomNames != null && lectureIndex < roomNames!.length)
                  ? roomNames![lectureIndex]
                  : roomName;
              return InkWell(
                child: RoomManagerInfoWidget(
                  location: lectureRoomName,
                  docName: lecture.lecturerName ?? '',
                  startTime: lecture.startTime ?? '',
                  lectureName: lecture.subjectName ?? '',
                  endTime: lecture.endTime ?? '',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
