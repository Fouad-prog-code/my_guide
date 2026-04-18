import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/my_bloc_observer.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/features/ui/auth/login/login_screen.dart';
import 'package:my_guide/features/ui/screens/doctor/doctor_screen.dart';
import 'package:my_guide/features/ui/screens/lecture_details_screen.dart';
import 'package:my_guide/features/ui/screens/student/student_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 872),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          builder: (context, widget) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: widget!,
            );
          },

          initialRoute: AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.studentRoute: (context) => const StudentScreen(),
            AppRoutes.lectureDetailsRoute: (context) =>
                const LectureDetailsScreen(),
            AppRoutes.doctorRoute: (context) => const DoctorScreen(),
          },
        );
      },
    );
  }
}
