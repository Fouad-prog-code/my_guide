import 'package:my_guide/domain/entities/response/year_table/year_table_lectures.dart';

class YearTableSchedule {
  final String? dayName;

  final List<YearTableLectures>? lectures;

  YearTableSchedule({this.dayName, this.lectures});
}
