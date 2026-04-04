import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 125.h,
          backgroundColor: AppColors.primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('جدول المحاضرات', style: AppStyles.regural24White),
              SizedBox(height: 11.h),
              Text('الفرقة الاولي', style: AppStyles.regural20White),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ScheduleDayWidget(day: 'السبت', numOfLectures: 3),
                ScheduleDayWidget(day: 'الاتنين', numOfLectures: 1),
                ScheduleDayWidget(day: 'الاربعاء', numOfLectures: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
