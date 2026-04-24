import 'package:my_guide/domain/entities/response/get_student/get_student_data.dart';

class GetStudentResponse {
  final bool? succeeded;

  final String? message;

  final List<GetStudentData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  GetStudentResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
