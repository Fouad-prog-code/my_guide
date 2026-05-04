import 'package:my_guide/domain/entities/response/department_table/department_table_day.dart';

class DepartmentTableData {
  final String? departmentName;

  final List<DepartmentTableDay>? days;

  DepartmentTableData({this.departmentName, this.days});
}
