import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/dashboard_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';
import 'package:my_guide/domain/repositories/dashboard_repository.dart';

@Injectable(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRemoteDataSource dashboardRemoteDataSource;

  DashboardRepositoryImpl({required this.dashboardRemoteDataSource});

  @override
  Future<DashboardResponse> getDashboard(String token) {
    return dashboardRemoteDataSource.getDashboard(token);
  }
}
