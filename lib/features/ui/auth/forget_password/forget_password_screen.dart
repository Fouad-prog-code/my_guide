import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';

import 'package:my_guide/core/utils/app_assets.dart';
import 'package:my_guide/core/utils/app_colors.dart';

import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/auth/forget_password/cubit/reset_password_states.dart';
import 'package:my_guide/features/ui/auth/forget_password/cubit/reset_password_view_model.dart';
import 'package:my_guide/features/ui/widgets/custom_elevated_button.dart';
import 'package:my_guide/features/ui/widgets/custom_password_text_field.dart';
import 'package:my_guide/features/ui/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isLoading = false;

  ResetPasswordViewModel viewModel = getIt<ResetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
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
                  Image.asset(AppAssets.userImage, height: 100.h),
                  SizedBox(height: 12.h),
                  Text(
                    'Reset Password',
                    style: AppStyles.regural32White.copyWith(fontSize: 28.sp),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      hintText: 'Enter username',
                      labelText: 'Username',
                      icon: Icons.person,
                      hintStyle: AppStyles.bold22DarkGray,
                      controller: viewModel.userController,
                      textType: TextInputType.text,
                      validator: (value) =>
                          AppValidators.validateUserName(userName: value),
                    ),
                    SizedBox(height: 20.h),

                    CustomTextFormField(
                      hintText: 'Enter National ID',
                      labelText: 'National ID',
                      icon: Icons.badge,
                      hintStyle: AppStyles.bold22DarkGray,
                      controller: viewModel.idController,
                      textType: TextInputType.number,
                      maxLength: 14,
                      validator: (value) {
                        return AppValidators.validateNationalId(id: value);
                      },
                    ),
                    SizedBox(height: 20.h),

                    CustomPasswordTextField(
                      hintText: 'New Password',
                      labelText: 'New Password',
                      controller: viewModel.newPasswordController,
                      validator: (value) =>
                          AppValidators.validateNewPassword(password: value),
                    ),

                    SizedBox(height: 40.h),

                    BlocConsumer<ResetPasswordViewModel, ResetPasswordStates>(
                      bloc: viewModel,
                      listener: (context, state) {
                        if (state is ResetPasswordErrorState) {
                          SnackBarUtils.showErrorSnackBar(
                            context,
                            state.message,
                          );
                        } else if (state is ResetPasswordSuccessState) {
                          SnackBarUtils.showSuccessSnackBar(
                            context,
                            state.forgetPasswordResponse.data ?? 'success',
                          );
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        isLoading = state is ResetPasswordLoadingState;
                        return CustomElevatedButton(
                          style: AppStyles.blod24White,
                          text: 'Update Password',
                          isLoading: isLoading,
                          onPressed: isLoading
                              ? null
                              : () {
                                  viewModel.resetPassword();
                                },
                        );
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
