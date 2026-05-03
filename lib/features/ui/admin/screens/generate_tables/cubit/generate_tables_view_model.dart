import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';
import 'package:my_guide/domain/use_case/generate_tables_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/generate_tables/cubit/generate_tables_states.dart';

@injectable
class GenerateTablesViewModel extends Cubit<GenerateTablesStates> {
  GenerateTablesUseCase generateTablesUseCase;
  GenerateTablesViewModel({required this.generateTablesUseCase})
    : super(GenerateTablesinitStates());

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController lectureDurationController = TextEditingController();
  TextEditingController lecturesPerDoctorController = TextEditingController();
  TextEditingController lecturesPerYearController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  generateTables() async {
    try {
      emit(GenerateTablesLoadingStates());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      GenerateTablesRequest generateTablesRequest = GenerateTablesRequest(
        dayStartTime: startTimeController.text,
        dayEndTime: endTimeController.text,
        lectureDurationMinutes: int.parse(lectureDurationController.text),
        maxLecturesPerDoctorPerDay: int.parse(lecturesPerDoctorController.text),
        maxLecturesPerYearPerDay: int.parse(lecturesPerYearController.text),
      );

      var response = await generateTablesUseCase.invoke(
        generateTablesRequest,
        token ?? '',
      );

      emit(GenerateTablesSuccessStates(generateTablesResponse: response));
    } on AppError catch (e) {
      emit(GenerateTablesErrorStates(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GenerateTablesErrorStates(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }
}
