import 'package:my_guide/api/models/response/get_dashboard/dashboard_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_data.dart';

extension DashboardDataMapper on DashboardDataDto {
  DashboardData toDashboardData() {
    return DashboardData(
      totalDoctors: totalDoctors,
      totalGroups: totalGroups,
      totalRooms: totalRooms,
      totalSubjects: totalSubjects,
      totalUsers: totalUsers,
    );
  }
}
