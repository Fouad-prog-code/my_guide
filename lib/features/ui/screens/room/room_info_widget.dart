import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/config/di.dart';
import 'package:my_guide/domain/entities/response/lectures.dart';
import 'package:my_guide/features/ui/screens/room/cubit/room_state_model.dart';
import 'package:my_guide/features/ui/screens/room/cubit/room_view_model.dart';
import 'package:my_guide/features/ui/widgets/schedule2_day_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

RoomViewModel roomViewModel = getIt<RoomViewModel>();

class RoomInfo extends StatefulWidget {
  RoomInfo({super.key});

  @override
  State<RoomInfo> createState() => _RoomInfoState();
}

class _RoomInfoState extends State<RoomInfo> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      roomViewModel.getRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.h,

        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(42.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Rooms',
              style: AppStyles.regural24White.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<RoomViewModel, RoomStates>(
        bloc: roomViewModel,
        builder: (context, state) {
          if (state is RoomErrorState) {
            return Center(
              child: Text(state.errorMessage, style: AppStyles.bold20primary),
            );
          } else if (state is RoomSuccessState) {
            final data = state.roomResponse.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text('No Data Found', style: AppStyles.bold20primary),
              );
            }

            // Group by room + day: each entry is one room on one day
            final List<_RoomEntry> roomEntries = [];
            for (final room in data) {
              final roomName = room.roomName ?? '';
              final schedules = room.weeklySchedule ?? [];
              for (final schedule in schedules) {
                final dayName = schedule.dayName ?? '';
                final lectures = schedule.lectures ?? [];
                if (lectures.isNotEmpty) {
                  roomEntries.add(
                    _RoomEntry(
                      roomName: roomName,
                      dayName: dayName,
                      lectures: lectures,
                    ),
                  );
                }
              }
            }

            // Sort by day order: Saturday → Thursday
            const dayOrder = [
              'Saturday',
              'Sunday',
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
            ];
            roomEntries.sort((a, b) {
              final indexA = dayOrder.indexOf(a.dayName);
              final indexB = dayOrder.indexOf(b.dayName);
              return (indexA == -1 ? 999 : indexA).compareTo(
                indexB == -1 ? 999 : indexB,
              );
            });

            if (roomEntries.isEmpty) {
              return Center(
                child: Text(
                  'No Schedules Found',
                  style: AppStyles.bold20primary,
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 24.h),
              child: ListView.builder(
                itemCount: roomEntries.length,
                itemBuilder: (context, index) {
                  final entry = roomEntries[index];
                  return Schedule2DayWidget(
                    day: entry.roomName,
                    subtitle: entry.dayName,
                    isStudent: false,
                    lectures: entry.lectures,
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

/// Helper class to hold a room with its day and lectures
class _RoomEntry {
  final String roomName;
  final String dayName;
  final List<Lectures> lectures;

  _RoomEntry({
    required this.roomName,
    required this.dayName,
    required this.lectures,
  });
}
