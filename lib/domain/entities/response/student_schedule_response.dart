
import 'student_day.dart';

class StudentScheduleResponse {

  final bool? succeeded;

  final String? message;

  final List<StudentDay>? data;

  final dynamic errors;

  final int? statusCode;

  final dynamic meta;

  StudentScheduleResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
