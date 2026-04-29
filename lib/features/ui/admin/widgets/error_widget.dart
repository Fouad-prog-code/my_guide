import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class ErrorsWidget extends StatelessWidget {
  const ErrorsWidget({super.key, required this.message, this.onPressed});
  final String message;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Center(child: Text(message, style: AppStyles.bold20DarkGray)),
        ),
        SizedBox(height: 8.h),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[900],
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadiusGeometry.circular(8.r),
            ),
          ),
          child: Text('try Again', style: AppStyles.regural16White),
        ),
      ],
    );
  }
}
