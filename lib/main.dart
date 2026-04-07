import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/features/ui/auth/login/login_screen.dart';
import 'package:my_guide/features/ui/screens/doctor/doctor_screen.dart';
import 'package:my_guide/features/ui/screens/lecture_details_screen.dart';
import 'package:my_guide/features/ui/screens/student/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 872),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginRoute,
        locale: Locale('ar'),
        routes: {
          AppRoutes.loginRoute: (context) => LoginScreen(),
          AppRoutes.studentRoute: (context) => StudentScreen(),
          AppRoutes.lectureDetailsRoute: (context) => LectureDetailsScreen(),
          AppRoutes.doctorRoute: (context) => DoctorScreen(),
        },
      ),
    );
  }
}
