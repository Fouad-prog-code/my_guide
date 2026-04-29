import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';

import 'package:my_guide/core/utils/app_styles.dart';

class LectureInfoWidget extends StatelessWidget {
  const LectureInfoWidget({
    super.key,
    required this.time,
    required this.location,
    required this.lectureName,
  });
  final String time;
  final String location;
  final String lectureName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: AppColors.primaryColor,
                size: 22,
              ),
              SizedBox(height: 5.h),
              Text(
                time,
                style: AppStyles.regural16Black.copyWith(fontSize: 12.sp),
              ),
            ],
          ),

          Container(
            height: 40.h,
            width: 1,
            color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lectureName,
                  style: AppStyles.blod20Black.copyWith(fontSize: 17.sp),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.place_outlined, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      location,
                      style: AppStyles.regural16Black.copyWith(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
