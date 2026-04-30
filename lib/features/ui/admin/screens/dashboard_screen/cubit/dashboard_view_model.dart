import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/use_case/dashboard_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/dashboard_screen/cubit/dashboard_states.dart';

@injectable
class DashboardViewModel extends Cubit<DashboardStates> {
  DashboardUseCase dashboardUseCase;
  DashboardViewModel({required this.dashboardUseCase})
    : super(DashboardInitState());

  getDashboard() async {
    try {
      emit(DashboardLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await dashboardUseCase.invoke(token ?? '');
      emit(DashboardSuccessState(dashboardResponse: response));
    } on AppError catch (e) {
      emit(DashboardErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DashboardErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }
}
