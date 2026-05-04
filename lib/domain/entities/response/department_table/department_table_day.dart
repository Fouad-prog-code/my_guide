import 'package:my_guide/domain/entities/response/department_table/department_table_lectures.dart';

class DepartmentTableDay {
  final String? dayName;

  final List<DepartmentTableLectures>? lectures;

  DepartmentTableDay({this.dayName, this.lectures});
}
