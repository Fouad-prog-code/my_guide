import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';
import 'package:my_guide/domain/use_case/add_department_use_case.dart';
import 'package:my_guide/domain/use_case/delete_dept_use_case.dart';
import 'package:my_guide/domain/use_case/get_department_use_case.dart';
import 'package:my_guide/domain/use_case/update_department_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/department_screen/cubit/department_states.dart';

@injectable
class DepartmentViewModel extends Cubit<DepartmentStates> {
  final AddDepartmentUseCase addDepartmentUseCase;
  final GetDepartmentUseCase getDepartmentUseCase;
  final UpdateDepartmentUseCase updateDepartmentUseCase;
  final DeleteDeptUseCase deleteDeptUseCase;

  DepartmentViewModel({
    required this.addDepartmentUseCase,
    required this.getDepartmentUseCase,
    required this.updateDepartmentUseCase,
    required this.deleteDeptUseCase,
  }) : super(DepartmentInitialState());

  final TextEditingController deptNameController = TextEditingController();
  final TextEditingController deptCodeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  GetDepartmentResponse? getDepartmentResponse;

  addDepartment() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddDepartmentLoadingState());

        String? token = await SharedPreferencesUtils.getData(key: 'token');

        AddDepartmentRequest addDepartmentRequest = AddDepartmentRequest(
          departmentName: deptNameController.text,
          departmentCode: deptCodeController.text,
        );

        var response = await addDepartmentUseCase.invoke(
          addDepartmentRequest,
          token ?? '',
        );

        emit(AddDepartmentSuccessState(addDepartmentResponse: response));
      } on AppError catch (e) {
        emit(AddDepartmentErrorState(errorMessage: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddDepartmentErrorState(
            errorMessage: message ?? 'UnExpected error occurred',
          ),
        );
      }
    }
  }

  getDepartment() async {
    try {
      emit(GetDepartmentLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await getDepartmentUseCase.invoke(token ?? '');
      getDepartmentResponse = response;
      emit(GetDepartmentSuccessState());
    } on AppError catch (e) {
      emit(GetDepartmentErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GetDepartmentErrorState(
          errorMessage: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  updateDepartment({
    required UpdateDepartmentRequest updateDepartmentRequest,
  }) async {
    try {
      emit(UpdateDepartmentLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await updateDepartmentUseCase.invoke(
        updateDepartmentRequest,
        token ?? '',
      );
      emit(UpdateDepartmentSuccessState(updateDepartmentResponse: response));
    } on AppError catch (e) {
      emit(UpdateDepartmentErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        UpdateDepartmentErrorState(
          errorMessage: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  deleteDepartment({required int deptId}) async {
    try {
      emit(DeleteDepartmentLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await deleteDeptUseCase.invoke(token ?? '', deptId);
      emit(DeleteDepartmentSuccessState(deleteDepartmentResponse: response));
    } on AppError catch (e) {
      emit(DeleteDepartmentErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DeleteDepartmentErrorState(
          errorMessage: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  List<String> get departmentNames {
    if (getDepartmentResponse?.data == null) {
      return [];
    }
    return getDepartmentResponse!.data!
        .map((dept) => dept.departmentName ?? '')
        .toList();
  }
}
