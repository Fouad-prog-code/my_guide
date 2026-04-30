import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_data.dart';

class DashboardResponse {
  final bool? succeeded;

  final String? message;

  final DashboardData? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  DashboardResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
