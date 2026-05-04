import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/config/my_bloc_observer.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_token.dart';
import 'package:my_guide/features/ui/admin/screens/admin_home_page.dart';
import 'package:my_guide/features/ui/auth/forget_password/forget_password_screen.dart';
import 'package:my_guide/features/ui/auth/login/login_screen.dart';
import 'package:my_guide/features/ui/screens/doctor_schedule/doctor_screen.dart';
import 'package:my_guide/features/ui/screens/lecture_details_screen.dart';
import 'package:my_guide/features/ui/screens/navigator_bar.dart';
import 'package:my_guide/features/ui/screens/student/studen_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  String routeName;

  String? token = await SharedPreferencesUtils.getData(key: 'token');

  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    String? role = AppToken.getRoleFromToken(token);
    if (role == 'Student') {
      routeName = AppRoutes.studentRoute;
    } else if (role == 'Doctor') {
      routeName = AppRoutes.doctorRoute;
    } else if (role == 'Manager') {
      routeName = AppRoutes.managerRoute;
    } else {
      routeName = AppRoutes.adminlayoutRoute;
    }
  }

  runApp(MyApp(routeName: routeName));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 872),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.studentRoute: (context) => const StudentScreen(),
            AppRoutes.managerRoute: (context) => NavigatorBar(),
            AppRoutes.lectureDetailsRoute: (context) =>
                const LectureDetailsScreen(),
            AppRoutes.doctorRoute: (context) => const DoctorScreen(),
            AppRoutes.adminlayoutRoute: (context) => const AdminLayout(),
            AppRoutes.forgetPasswordRoute: (context) =>
                const ForgetPasswordScreen(),
          },
        );
      },
    );
  }
}
