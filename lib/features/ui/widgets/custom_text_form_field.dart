import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.textType,
    this.controller,
    this.prefixIcon,
    this.radius = 12,
    this.hintStyle,
    this.borderSideColor = AppColors.primaryColor,
    this.filledColor = true,
  });

  final String? labelText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final IconData icon;
  final bool obscureText;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textType;
  final double radius;
  TextStyle? hintStyle = AppStyles.bold22DarkGray;
  Color borderSideColor;
  bool filledColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Text(labelText!, style: AppStyles.bold24Black)
            : SizedBox(),
        SizedBox(height: 8.h),
        TextFormField(
          validator: (value) {
            return validator!(value);
          },
          keyboardType: textType,
          obscureText: obscureText,
          // obscuringCharacter: '*',
          controller: controller,
          style: AppStyles.bold24Black,
          decoration: InputDecoration(
            hintText: hintText,
            // fillColor: AppColors.primaryColor,
            // filled: filledColor,
            hintStyle: hintStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderSideColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderSideColor, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderSideColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderSideColor, width: 2),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: Container(
              margin: EdgeInsets.only(left: 8.w, right: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 28, color: AppColors.whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
