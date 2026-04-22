import 'package:my_guide/domain/entities/common/add_user/add_user_data.dart';

class AddUserResponse {
  final bool? succeeded;

  final String? message;

  final AddUserData? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  AddUserResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
