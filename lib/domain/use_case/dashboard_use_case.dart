import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';
import 'package:my_guide/domain/repositories/dashboard_repository.dart';

@injectable
class DashboardUseCase {
  DashboardRepository dashboardRepository;

  DashboardUseCase({required this.dashboardRepository});

  Future<DashboardResponse> invoke(String token) {
    return dashboardRepository.getDashboard(token);
  }
}
