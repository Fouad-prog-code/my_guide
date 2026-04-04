import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/widgets/lecture_info_widget.dart';

class ScheduleDayWidget extends StatelessWidget {
  const ScheduleDayWidget({
    super.key,
    required this.day,
    required this.numOfLectures,
  });

  final String day;
  final int numOfLectures;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 32.h),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(day, style: AppStyles.bold24Black),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '$numOfLectures محاضرة',
                    style: AppStyles.regural14White,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: numOfLectures,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index != 0)
                      Divider(
                        height: 20,
                        thickness: 1,
                        color: AppColors.darkGrayColor,
                        indent: 22,
                        endIndent: 22,
                      ),
                    LectureInfoWidget(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
