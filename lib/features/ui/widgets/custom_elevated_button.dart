import 'package:flutter/material.dart';

import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.style,
    this.minimumSize,
    this.raduis = 15,
  });
  final String text;
  final Function()? onPressed;
  final bool isLoading;
  final TextStyle? style;
  final Size? minimumSize;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: minimumSize ?? Size(double.infinity, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: AppColors.whiteColor)
          : Text(text, style: style ?? AppStyles.blod36White),
    );
  }
}
