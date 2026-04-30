import 'package:my_guide/api/mappers/dashboard_data_mapper.dart';
import 'package:my_guide/api/models/response/get_dashboard/dashboard_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';

extension DashboardResponseMapper on DashboardResponseDto {
  DashboardResponse toDashboardResponse() {
    return DashboardResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      errors: errors,
      meta: meta,
      data: data!.toDashboardData(),
    );
  }
}
