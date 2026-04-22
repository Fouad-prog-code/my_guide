import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/domain/entities/response/login/data_response.dart';
import 'package:my_guide/features/ui/screens/doctor_schedule/cubit/doctor_schedule_states.dart';
import 'package:my_guide/features/ui/screens/doctor_schedule/cubit/doctor_schedule_view_model.dart';
import 'package:my_guide/features/ui/widgets/schedule_day_widget.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DoctorScheduleViewModel viewModel = getIt<DoctorScheduleViewModel>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
          {};

      final String doctorId = args["userId"] ?? '';
      final Data data = args["data"] ?? '';

      viewModel.getDoctorScedule(
        doctorId: int.parse(doctorId),
        token: data.token ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};

    Data data = args['data'] ?? {};

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.h,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(42.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome ',
                      style: AppStyles.regural24White.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: data.fullName,
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
      body: BlocBuilder<DoctorScheduleViewModel, DoctorScheduleStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is DoctorErrorState) {
            return Center(
              child: Text(state.message, style: AppStyles.bold20primary),
            );
          } else if (state is DoctorSuccessState) {
            final doctorData = state.response.data ?? [];
            if (doctorData.isEmpty) {
              return Center(
                child: Text('No Data Found', style: AppStyles.bold20primary),
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
                    lectures: doctorData[index].lectures ?? [],
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
