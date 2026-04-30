import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';

abstract class DashboardRepository {
  Future<DashboardResponse> getDashboard(String token);
}
