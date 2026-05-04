import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';

abstract class TablesStates {}

class TablesinitStates extends TablesStates {}

class YearTablesLoadingStates extends TablesStates {}

class YearTablesErrorStates extends TablesStates {
  final String message;
  YearTablesErrorStates({required this.message});
}

class YearTablesSuccessStates extends TablesStates {}

class DepartmentTablesLoadingStates extends TablesStates {}

class DepartmentTablesErrorStates extends TablesStates {
  final String message;
  DepartmentTablesErrorStates({required this.message});
}

class DepartmentTablesSuccessStates extends TablesStates {}
