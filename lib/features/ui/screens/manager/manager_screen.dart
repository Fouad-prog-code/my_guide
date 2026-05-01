import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';

import 'package:my_guide/domain/entities/response/lectures.dart';
import 'package:my_guide/domain/entities/response/login/data_response.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';
import 'package:my_guide/features/ui/screens/room/cubit/room_state_model.dart';
import 'package:my_guide/features/ui/screens/room/cubit/room_view_model.dart';
import 'package:my_guide/features/ui/widgets/drawer_widget.dart';
import 'package:my_guide/features/ui/widgets/schedule2_day_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

RoomViewModel roomViewModel = getIt<RoomViewModel>();

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _RoomInfoState();
}

class _RoomInfoState extends State<ManagerScreen> {
  // Day order: Saturday to Thursday
  static const List<String> _dayOrder = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      roomViewModel.getRooms();
    });
  }

  List<_DayGroup> _groupByDay(List<dynamic> data) {
    final Map<String, List<_LectureWithRoom>> dayMap = {};

    for (final room in data) {
      final roomName = room.roomName ?? '';
      final schedules = room.weeklySchedule ?? [];
      for (final schedule in schedules) {
        final dayName = schedule.dayName ?? '';
        final lectures = schedule.lectures ?? <Lectures>[];
        for (final lecture in lectures) {
          dayMap.putIfAbsent(dayName, () => []);
          dayMap[dayName]!.add(
            _LectureWithRoom(lecture: lecture, roomName: roomName),
          );
        }
      }
    }

    final sortedDays = dayMap.keys.toList()
      ..sort((a, b) {
        final indexA = _dayOrder.indexOf(a);
        final indexB = _dayOrder.indexOf(b);
        // Put unknown days at the end
        return (indexA == -1 ? 999 : indexA).compareTo(
          indexB == -1 ? 999 : indexB,
        );
      });

    return sortedDays
        .map((day) => _DayGroup(dayName: day, lectures: dayMap[day]!))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Data data = map['data'];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.h,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(42.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.fullName ?? '',
                  style: AppStyles.regural24White.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Doctors Schedule',
                  style: AppStyles.regural16White.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(data: data),
      body: BlocBuilder<RoomViewModel, RoomStates>(
        bloc: roomViewModel,
        builder: (context, state) {
          if (state is RoomErrorState) {
            return ErrorsWidget(
              message: state.errorMessage,
              onPressed: () {
                roomViewModel.getRooms();
              },
            );
          } else if (state is RoomSuccessState) {
            final data = state.roomResponse.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text('No Data Found', style: AppStyles.bold20primary),
              );
            }

            // Group lectures by day across all rooms
            final dayGroups = _groupByDay(data);

            if (dayGroups.isEmpty) {
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
                itemCount: dayGroups.length,
                itemBuilder: (context, index) {
                  final dayGroup = dayGroups[index];
                  // Convert _LectureWithRoom list back to Lectures list
                  // and pass room names for display
                  final lectures = dayGroup.lectures
                      .map((e) => e.lecture)
                      .toList();
                  // Build room names string for each lecture
                  return Schedule2DayWidget(
                    day: dayGroup.dayName,
                    isStudent: false,
                    lectures: lectures,
                    // Pass per-lecture room names so the widget can show them
                    roomNames: dayGroup.lectures
                        .map((e) => e.roomName)
                        .toList(),
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

/// Holds a single lecture along with the room it belongs to
class _LectureWithRoom {
  final Lectures lecture;
  final String roomName;

  _LectureWithRoom({required this.lecture, required this.roomName});
}

/// Holds all lectures for a single day (across all rooms)
class _DayGroup {
  final String dayName;
  final List<_LectureWithRoom> lectures;

  _DayGroup({required this.dayName, required this.lectures});
}
