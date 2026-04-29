import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';
import 'package:my_guide/domain/use_case/add_manager_use_case.dart';

import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_states.dart';

@injectable
class ManagerViewModel extends Cubit<ManagerStates> {
  AddManagerUseCase addManagerUseCase;

  ManagerViewModel({required this.addManagerUseCase})
    : super(ManagerInitState());

  final fullNameController = TextEditingController();
  final idController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  addManager() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddManagerLoadingState());

        AddDoctOrManagerRequest addManagerRequest = AddDoctOrManagerRequest(
          userName: userNameController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          nationalId: idController.text,
        );

        String? token = await SharedPreferencesUtils.getData(key: 'token');

        var response = await addManagerUseCase.invoke(
          addManagerRequest,
          token ?? '',
        );

        emit(AddManagerSuccessState(addManagerResponse: response));
      } on AppError catch (e) {
        emit(AddManagerErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddManagerErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }

  // getDoctor() async {
  //   try {
  //     emit(GetDoctorLoadingState());

  //     String? token = await SharedPreferencesUtils.getData(key: 'token');

  //     var response = await getDoctorUseCase.invoke(token ?? '');
  //     getDoctorResponse = response;
  //     emit(GetDoctorSuccessState());
  //     // fullNameController.clear();
  //     // userNameController.clear();
  //     // passwordController.clear();
  //     // idController.clear();
  //   } on AppError catch (e) {
  //     emit(GetDoctorErrorState(message: e.errorMessage));
  //   } on DioException catch (e) {
  //     final message = (e.error is AppError)
  //         ? (e.error as AppError).errorMessage
  //         : e.message;
  //     emit(
  //       GetDoctorErrorState(message: message ?? 'UnExpected error occurred'),
  //     );
  //   }
  // }

  // updateDoctor({required UpdateDoctorRequest updateDoctorRequest}) async {
  //   try {
  //     emit(UpdateDoctorLoadingState());

  //     String? token = await SharedPreferencesUtils.getData(key: 'token');

  //     var response = await updateDoctorUseCase.invoke(
  //       updateDoctorRequest,
  //       token ?? '',
  //     );

  //     emit(UpdateDoctorSuccessState(updateDoctorResponse: response));
  //   } on AppError catch (e) {
  //     emit(UpdateDoctorErrorState(message: e.errorMessage));
  //   } on DioException catch (e) {
  //     final message = (e.error is AppError)
  //         ? (e.error as AppError).errorMessage
  //         : e.message;
  //     emit(
  //       UpdateDoctorErrorState(message: message ?? 'UnExpected error occurred'),
  //     );
  //   }
  // }
}
