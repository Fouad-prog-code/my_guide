import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';
import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';
import 'package:my_guide/domain/use_case/add_doctor_use_case.dart';
import 'package:my_guide/domain/use_case/get_doctor_use_case.dart';
import 'package:my_guide/domain/use_case/update_doctor_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/cubit/doctor_states.dart';

@injectable
class DoctorViewModel extends Cubit<DoctorStates> {
  AddDoctorUseCase addDoctorUseCase;
  GetDoctorUseCase getDoctorUseCase;
  UpdateDoctorUseCase updateDoctorUseCase;

  DoctorViewModel({
    required this.addDoctorUseCase,
    required this.getDoctorUseCase,
    required this.updateDoctorUseCase,
  }) : super(DoctorInitState());

  final fullNameController = TextEditingController();
  final idController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  GetDoctorResponse? getDoctorResponse;

  addDoctor({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddDoctorLoadingState());

        AddDoctorRequest addDoctorRequest = AddDoctorRequest(
          userName: userNameController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          nationalId: idController.text,
        );

        var response = await addDoctorUseCase.invoke(addDoctorRequest, token);

        emit(AddDoctorSuccessState(addDoctorResponse: response));
      } on AppError catch (e) {
        emit(AddDoctorErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddDoctorErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }

  getDoctor() async {
    try {
      emit(GetDoctorLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await getDoctorUseCase.invoke(token ?? '');
      getDoctorResponse = response;
      emit(GetDoctorSuccessState());
      // fullNameController.clear();
      // userNameController.clear();
      // passwordController.clear();
      // idController.clear();
    } on AppError catch (e) {
      emit(GetDoctorErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GetDoctorErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }

  updateDoctor({required UpdateDoctorRequest updateDoctorRequest}) async {
    try {
      emit(UpdateDoctorLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await updateDoctorUseCase.invoke(
        updateDoctorRequest,
        token ?? '',
      );

      emit(UpdateDoctorSuccessState(updateDoctorResponse: response));
    } on AppError catch (e) {
      emit(UpdateDoctorErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        UpdateDoctorErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }
}
