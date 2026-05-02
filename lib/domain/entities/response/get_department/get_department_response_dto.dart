import 'package:my_guide/domain/entities/response/get_department/get_department_data.dart';

class GetDepartmentResponse {
  final bool? succeeded;

  final String? message;

  final List<GetDepartmentData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  GetDepartmentResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
