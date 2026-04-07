import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'مرحباً د. ',
                        style: AppStyles.regural24White.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'احمد محمد',
                        style: AppStyles.regural24White.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'جدول المحاضرات',
                  style: AppStyles.regural16White.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ScheduleDayWidget(
                  day: 'السبت',
                  numOfLectures: 3,
                  isStudent: false,
                ),
                ScheduleDayWidget(
                  day: 'الاتنين',
                  numOfLectures: 1,
                  isStudent: false,
                ),
                ScheduleDayWidget(
                  day: 'الاربعاء',
                  numOfLectures: 2,
                  isStudent: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
