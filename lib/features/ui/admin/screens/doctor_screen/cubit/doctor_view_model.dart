import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';
import 'package:my_guide/domain/use_case/add_doctor_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_states.dart';

@injectable
class DoctorViewModel extends Cubit<DoctorStates> {
  AddDoctorUseCase addDoctorUseCase;

  DoctorViewModel({required this.addDoctorUseCase}) : super(DoctorInitState());

  final fullNameController = TextEditingController();
  final idController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  addDoctor({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(DoctorLoadingState());

        AddDoctorRequest addDoctorRequest = AddDoctorRequest(
          userName: userNameController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          nationalId: idController.text,
        );

        var response = await addDoctorUseCase.invoke(addDoctorRequest, token);

        emit(DoctorSuccessState(addDoctorResponse: response));
      } on AppError catch (e) {
        emit(DoctorErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(DoctorErrorState(message: message ?? 'UnExpected error occurred'));
      }
    }
  }
}
