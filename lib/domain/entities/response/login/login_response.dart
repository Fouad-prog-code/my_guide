import 'package:my_guide/domain/entities/response/login/data_response.dart';

class LoginResponse {
  final bool? succeeded;

  final String? message;

  final Data? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  LoginResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
