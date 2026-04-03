import 'package:flutter/material.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/features/ui/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.labelText,
    required this.hintText,
    this.validator,
    this.controller,
    this.borderSideColor = AppColors.whiteColor,
  });
  final String? labelText;
  final String hintText;
  final dynamic Function(String?)? validator;
  final TextEditingController? controller;
  final Color borderSideColor;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isVisible = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      // borderSideColor: widget.borderSideColor,
      labelText: 'Password',
      hintText: widget.hintText,

      controller: widget.controller,
      textType: TextInputType.visiblePassword,
      validator: (value) {
        return widget.validator!(value);
      },
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          isVisible = !isVisible;
          obscureText = !obscureText;
          setState(() {});
        },
        icon: Icon(
          isVisible ? Icons.visibility : Icons.visibility_off,
          color: AppColors.blackColor,
          size: 40,
        ),
      ),
      icon: Icons.lock,
    );
  }
}
