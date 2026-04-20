import 'package:my_guide/domain/entities/response/doctor/doctor_data.dart';

class DoctorResponse {
  final bool? succeeded;

  final String? message;

  final List<DoctorData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  DoctorResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
