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

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.r),
                  bottomRight: Radius.circular(60.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Image.asset(AppAssets.userImage, height: 120.h),
                  SizedBox(height: 8.h),
                  Text('Sign in', style: AppStyles.regural32White),
                ],
              ),
            ),

            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      hintText: 'email address',
                      labelText: 'Email',
                      icon: Icons.email_outlined,
                      controller: emailController,
                      validator: (value) =>
                          AppValidators.validateEmail(email: value),
                    ),
                    SizedBox(height: 20.h),
                    CustomPasswordTextField(
                      hintText: 'password',
                      controller: passwordController,
                      validator: (value) =>
                          AppValidators.validatePassword(password: value),
                    ),

                    SizedBox(height: 60.h),

                    CustomElevatedButton(
                      text: 'Log in',
                      isLoading: isLoading,
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
          ],
        ),
      ),
    );
  }
}
