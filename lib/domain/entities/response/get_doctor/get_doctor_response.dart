import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_data.dart';

class GetDoctorResponse {
  final bool? succeeded;

  final String? message;

  final List<GetDoctorData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  GetDoctorResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
