import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';
import 'package:my_guide/domain/use_case/department_table_use_case.dart';
import 'package:my_guide/domain/use_case/get_year_table_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/tables_screen/cubit/tables_states.dart';

@injectable
class TablesViewModel extends Cubit<TablesStates> {
  GetYearTableUseCase yearTableUseCase;
  DepartmentTableUseCase departmentTableUseCase;

  TablesViewModel({
    required this.yearTableUseCase,
    required this.departmentTableUseCase,
  }) : super(TablesinitStates());

  YearTableResponse? yearTableResponse;
  DepartmentTableResponse? departmentTableResponse;

  getYearTables() async {
    try {
      emit(YearTablesLoadingStates());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await yearTableUseCase.invoke(token ?? '');
      yearTableResponse = response;
      emit(YearTablesSuccessStates());
    } on AppError catch (e) {
      emit(YearTablesErrorStates(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        YearTablesErrorStates(message: message ?? 'UnExpected error occurred'),
      );
    }
  }

  getDepartmentTables() async {
    try {
      emit(DepartmentTablesLoadingStates());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await departmentTableUseCase.invoke(token ?? '');
      departmentTableResponse = response;
      emit(DepartmentTablesSuccessStates());
    } on AppError catch (e) {
      emit(DepartmentTablesErrorStates(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DepartmentTablesErrorStates(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }
}
