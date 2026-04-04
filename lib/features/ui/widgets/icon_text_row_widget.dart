import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class IconTextRowWidget extends StatelessWidget {
  const IconTextRowWidget({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Row(
        children: [
          Icon(icon, size: 30, color: AppColors.blackColor),
          SizedBox(width: 12.w),
          Text(text, style: AppStyles.regural20Black),
        ],
      ),
    );
  }
}
