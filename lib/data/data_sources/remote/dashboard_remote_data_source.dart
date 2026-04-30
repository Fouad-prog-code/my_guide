import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardResponse> getDashboard(String token);
}
