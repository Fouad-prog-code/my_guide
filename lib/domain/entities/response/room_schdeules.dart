import 'package:my_guide/domain/entities/response/lectures.dart';

class WeeklySchedule {
  final String? dayName;

  final List<Lectures>? lectures;

  WeeklySchedule({this.dayName, this.lectures});
}
