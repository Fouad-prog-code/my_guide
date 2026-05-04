import 'package:my_guide/domain/entities/response/department_table/department_table_data.dart';

class DepartmentTableResponse {
  final bool? succeeded;

  final String? message;

  final List<DepartmentTableData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  DepartmentTableResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
