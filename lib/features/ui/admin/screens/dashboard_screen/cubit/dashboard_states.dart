import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';

abstract class DashboardStates {}

class DashboardInitState extends DashboardStates {}

class DashboardLoadingState extends DashboardStates {}

class DashboardErrorState extends DashboardStates {
  String message;

  DashboardErrorState({required this.message});
}

class DashboardSuccessState extends DashboardStates {
  DashboardResponse dashboardResponse;

  DashboardSuccessState({required this.dashboardResponse});
}
