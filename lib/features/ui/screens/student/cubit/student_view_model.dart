import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/use_case/student_schedule_use_case.dart';
import 'package:my_guide/features/ui/screens/student/cubit/student_state_model.dart';

@injectable
class StudentViewModel extends Cubit<StudentStates> {
  StudentScheduleUseCase studentScheduleUseCase;

  StudentViewModel({required this.studentScheduleUseCase})
    : super(StudentLoadingState());

  void getStudentSchedule() async {
    try {
      emit(StudentLoadingState());
      String? token = await SharedPreferencesUtils.getData(key: 'token');
      var response = await studentScheduleUseCase.invoke(token ?? '');
      emit(StudentSuccessState(studentScheduleResponse: response));
    } on AppError catch (e) {
      emit(StudentErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        StudentErrorState(
          errorMessage: message ?? 'An unexpected error occurred',
        ),
      );
    }
  }
}
