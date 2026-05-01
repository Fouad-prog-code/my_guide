import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';
import 'package:my_guide/domain/use_case/add_manager_use_case.dart';
import 'package:my_guide/domain/use_case/delete_manager_use_case.dart';
import 'package:my_guide/domain/use_case/get_manager_use_case.dart';
import 'package:my_guide/domain/use_case/update_manager_use_case.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';

import 'package:my_guide/features/ui/admin/screens/manager_screen/cubit/manager_states.dart';

@injectable
class ManagerViewModel extends Cubit<ManagerStates> {
  AddManagerUseCase addManagerUseCase;
  GetManagerUseCase getManagerUseCase;
  UpdateManagerUseCase updateManagerUseCase;
  DeleteManagerUseCase deleteManagerUseCase;

  GetManagerResponse? getManagerResponse;

  ManagerViewModel({
    required this.addManagerUseCase,
    required this.getManagerUseCase,
    required this.updateManagerUseCase,
    required this.deleteManagerUseCase,
  }) : super(ManagerInitState());

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

        userNameController.clear();
        idController.clear();
        passwordController.clear();
        fullNameController.clear();
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

  getManager() async {
    try {
      emit(GetManagerLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await getManagerUseCase.invoke(token ?? '');
      getManagerResponse = response;
      emit(GetManagerSuccessState());
    } on AppError catch (e) {
      emit(GetManagerErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GetManagerErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }

  updateManager({required UpdateManagerRequest updateManagerRequest}) async {
    try {
      emit(UpdateManagerLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await updateManagerUseCase.invoke(
        updateManagerRequest,
        token ?? '',
      );

      emit(UpdateManagerSuccessState(updateManagerResponse: response));
    } on AppError catch (e) {
      emit(UpdateManagerErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        UpdateManagerErrorState(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  // }

  deleteManager({required int managerId}) async {
    try {
      emit(DeleteManagerLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await deleteManagerUseCase.invoke(
        managerId,
        token ?? '',
      );

      emit(DeleteManagerSuccessState(deleteManagerResponse: response));
    } on AppError catch (e) {
      emit(DeleteManagerErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DeleteManagerErrorState(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }
}
