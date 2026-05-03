import 'package:my_guide/domain/entities/response/year_table/year_table_data.dart';

class YearTableResponse {
  final bool? succeeded;

  final String? message;

  final List<YearTableData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  YearTableResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
