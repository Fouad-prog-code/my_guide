import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_data.dart';

class DeleteDoctorResponse {
  final bool? succeeded;

  final String? message;

  final DeleteDoctorData? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  DeleteDoctorResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
