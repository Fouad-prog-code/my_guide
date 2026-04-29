import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_assets.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/core/utils/validators.dart';
import 'package:my_guide/features/ui/auth/login/cubit/login_states.dart';
import 'package:my_guide/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:my_guide/features/ui/widgets/custom_elevated_button.dart';
import 'package:my_guide/features/ui/widgets/custom_password_text_field.dart';
import 'package:my_guide/features/ui/widgets/custom_text_form_field.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  LoginViewModel viewModel = getIt<LoginViewModel>();

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    CustomPasswordTextField(
                      hintText: 'Password',
                      controller: viewModel.passwordController,
                      validator: (value) =>
                          AppValidators.validatePassword(password: value),
                    ),
                    SizedBox(height: 0.h),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgetPasswordRoute,
                          );
                        },
                        isSemanticButton: false,
                        child: Text(
                          'forget password?',
                          style: AppStyles.bold20primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    BlocConsumer<LoginViewModel, LoginStates>(
                      bloc: viewModel,
                      listener: (context, state) {
                        if (state is LoginErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: AppColors.primaryColor,
                            ),
                          );
                        } else if (state is LoginSuccessState) {
                          String? token = state.response.data!.token;

                          String? role = getRoleFromToken(token ?? '');

                          String? userId = getUserIdFromToken(token ?? '');
                          String? acYear = getAcademicYearFromToken(
                            token ?? "",
                          );

                          print(role);

                          SharedPreferencesUtils.setData(
                            key: 'token',
                            value: token ?? '',
                          );

                          if (role == 'Doctor') {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.doctorRoute,
                              arguments: {
                                'data': state.response.data,
                                'userId': userId,
                              },
                            );
                            return;
                          } else if (role == 'Student') {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.studentRoute,
                              arguments: acYear,
                            );
                          } else if (role == 'Manager') {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.managerRoute,
                              arguments: state.response.data,
                            );
                          } else if (role == 'Admin') {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.adminlayoutRoute,
                              arguments: state.response.data,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Role not recognized'),
                                backgroundColor: AppColors.primaryColor,
                              ),
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        isLoading = state is LoginLoadingState;
                        return CustomElevatedButton(
                          text: 'Login',
                          isLoading: isLoading,
                          onPressed: isLoading ? null : viewModel.login,
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

  String? getRoleFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      final Map<String, dynamic> data = json.decode(decoded);

      return data["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
    } catch (e) {
      return null;
    }
  }

  String? getUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      final Map<String, dynamic> data = json.decode(decoded);

      return data["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
    } catch (e) {
      return null;
    }
  }

  String? getAcademicYearFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      final Map<String, dynamic> data = json.decode(decoded);

      // المفتاح اللي موجود في الـ Token بتاعك هو AcademicYearId
      return data["AcademicYearId"]?.toString();
    } catch (e) {
      return null;
    }
  }
}
