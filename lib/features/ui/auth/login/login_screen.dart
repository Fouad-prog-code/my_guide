import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_assets.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/widgets/custom_elevated_button.dart';
import 'package:my_guide/features/ui/widgets/custom_password_text_field.dart';
import 'package:my_guide/features/ui/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 288.h,
        backgroundColor: AppColors.primaryColor,
        title: Column(
          children: [
            Image.asset(AppAssets.userImage),
            Text('Sign in', style: AppStyles.regural32White),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 32.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'email address',
                  labelText: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                  validator: (value) {
                    return AppValidators.validateEmail(email: value);
                  },
                ),
                SizedBox(height: 16.h),
                CustomPasswordTextField(
                  hintText: 'password',
                  controller: passwordController,
                  validator: (value) {
                    return AppValidators.validatePassword(password: value);
                  },
                ),
                SizedBox(height: 72.h),
                CustomElevatedButton(
                  text: 'Log in',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.studentRoute,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
