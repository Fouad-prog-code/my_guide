import 'package:my_guide/domain/entities/response/get_subject/get_subject_data.dart';

class GetSubjectResponse {
  final bool? succeeded;

  final String? message;

  final List<GetSubjectData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  GetSubjectResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
