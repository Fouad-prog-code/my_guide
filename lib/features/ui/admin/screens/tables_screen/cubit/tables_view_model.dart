import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/use_case/get_year_table_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/tables_screen/cubit/tables_states.dart';

@injectable
class TablesViewModel extends Cubit<TablesStates> {
  GetYearTableUseCase yearTableUseCase;

  TablesViewModel({required this.yearTableUseCase}) : super(TablesinitStates());

  getYearTables() async {
    try {
      emit(YearTablesLoadingStates());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await yearTableUseCase.invoke(token ?? '');
      emit(YearTablesSuccessStates(yearTableResponse: response));
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
}
