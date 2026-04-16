import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'جدول المحاضرات',
                style: AppStyles.regural24White.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'الفرقة الأولى',
                style: AppStyles.regural16White.copyWith(color: Colors.white70),
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
                isStudent: true,
              ),
              ScheduleDayWidget(
                day: 'الاتنين',
                numOfLectures: 1,
                isStudent: true,
              ),
              ScheduleDayWidget(
                day: 'الاربعاء',
                numOfLectures: 2,
                isStudent: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
