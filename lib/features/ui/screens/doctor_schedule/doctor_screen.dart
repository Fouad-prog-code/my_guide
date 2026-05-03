import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';
import 'package:my_guide/features/ui/screens/doctor_schedule/cubit/doctor_schedule_states.dart';
import 'package:my_guide/features/ui/screens/doctor_schedule/cubit/doctor_schedule_view_model.dart';
import 'package:my_guide/features/ui/widgets/drawer_widget.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DoctorScheduleViewModel viewModel = getIt<DoctorScheduleViewModel>();

  String fullName = 'User Name';
  String userName = '@username';
  String doctorId = '0';
  String token = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final fName = await SharedPreferencesUtils.getData(key: 'fullName');
    final uName = await SharedPreferencesUtils.getData(key: 'userName');
    final docId = await SharedPreferencesUtils.getData(key: 'userId');
    final tok = await SharedPreferencesUtils.getData(key: 'token');
    if (mounted) {
      setState(() {
        fullName = fName ?? 'User Name';
        userName = uName ?? '@username';
        doctorId = docId ?? '0';
        token = tok ?? "";
      });

      if (doctorId != '0' && token.isNotEmpty) {
        viewModel.getDoctorScedule(doctorId: int.parse(doctorId), token: token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.h,
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(42.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                maxLines: 2,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome Dr. ',
                      style: AppStyles.regural24White.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: fullName,
                      style: AppStyles.regural24White.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Lectures Schedule',
                style: AppStyles.regural16White.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(fullName: fullName, userName: userName),
      body: BlocBuilder<DoctorScheduleViewModel, DoctorScheduleStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is DoctorErrorState) {
            return ErrorsWidget(
              message: state.message,
              onPressed: () {
                viewModel.getDoctorScedule(
                  doctorId: int.parse(doctorId),
                  token: token,
                );
              },
            );
          } else if (state is DoctorSuccessState) {
            final doctorData = state.response.data ?? [];
            if (doctorData.isEmpty) {
              return Center(
                child: Text('No Data Found', style: AppStyles.bold20DarkGray),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 24.h),
              child: ListView.builder(
                itemCount: doctorData.length,
                itemBuilder: (context, index) {
                  return ScheduleDayWidget(
                    day: doctorData[index].dayName ?? '',
                    numOfLectures: doctorData[index].lectures?.length ?? 0,
                    isStudent: false,
                    doctoLectures: doctorData[index].lectures ?? [],
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
