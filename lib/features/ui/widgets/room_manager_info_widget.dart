import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class RoomManagerInfoWidget extends StatelessWidget {
  const RoomManagerInfoWidget({
    super.key,
    required this.startTime,
    required this.endTime,
    this.location = '',
    this.lectureName = '',
    this.docName = '',
  });
  final String startTime;
  final String endTime;
  final String location;
  final String lectureName;
  final String docName;

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
              Row(
                children: [
                  Text(
                    startTime.split(' - ')[0],
                    style: AppStyles.regural16Black.copyWith(fontSize: 12.sp),
                  ),
                  Text('_'),
                  Text(
                    endTime.split(' - ')[0],
                    style: AppStyles.regural16Black.copyWith(fontSize: 12.sp),
                  ),
                ],
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
                  docName,
                  style: AppStyles.blod20Black.copyWith(fontSize: 17.sp),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    // Icon(Icons.place_outlined, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      lectureName,
                      style: AppStyles.regural16Black.copyWith(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                if (location.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 16.sp,
                        color: AppColors.darkGrayColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        location,
                        style: AppStyles.regural16Black.copyWith(
                          color: AppColors.darkGrayColor,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Icon(
          //   Icons.arrow_forward_ios_rounded,
          //   size: 16.sp,
          //   color: Colors.grey.shade400,
          // ),
        ],
      ),
    );
  }
}
