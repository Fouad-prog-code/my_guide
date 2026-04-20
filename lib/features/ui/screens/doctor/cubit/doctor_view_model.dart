import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/use_case/doctor_use_case.dart';
import 'package:my_guide/features/ui/screens/doctor/cubit/doctor_states.dart';

@injectable
class DoctorViewModel extends Cubit<DoctorStates> {
  DoctorUseCase doctorUseCase;

  DoctorViewModel({required this.doctorUseCase}) : super(DoctorinitState());

  getDoctorScedule({required int doctorId, required String token}) async {
    try {
      emit(DoctorLoadingState());

      var response = await doctorUseCase.invoke(doctorId, token);
      emit(DoctorSuccessState(response: response));
    } on AppError catch (e) {
      emit(DoctorErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DoctorErrorState(message: message ?? 'An unexpected error occurred'),
      );
    }
  }
}
