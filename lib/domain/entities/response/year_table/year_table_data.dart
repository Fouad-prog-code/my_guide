import 'package:my_guide/domain/entities/response/year_table/year_table_schedule.dart';

class YearTableData {
  final int? yearId;

  final String? yearName;

  final List<YearTableSchedule>? schedules;

  YearTableData({this.yearId, this.yearName, this.schedules});
}
