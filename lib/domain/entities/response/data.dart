import 'package:my_guide/domain/entities/response/room_schdeules.dart';

class Data {
  final int? roomId;

  final String? roomName;

  final List<WeeklySchedule>? weeklySchedule;

  Data({this.roomId, this.roomName, this.weeklySchedule});
}
