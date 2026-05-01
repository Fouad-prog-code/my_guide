import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';
import 'package:my_guide/domain/use_case/add_student_use_case.dart';
import 'package:my_guide/domain/use_case/delete_student_use_case.dart';
import 'package:my_guide/domain/use_case/get_student_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_states.dart';

@injectable
class StudentViewModel extends Cubit<StudentStates> {
  AddStudentUseCase addStudentUseCase;
  GetStudentUseCase getStudentUseCase;
  DeleteStudentUseCase deleteStudentUseCase;

  StudentViewModel({
    required this.addStudentUseCase,
    required this.getStudentUseCase,
    required this.deleteStudentUseCase,
  }) : super(StudentInitState());

  String? selectedYear;
  String? selectedDept;

  final fullNameController = TextEditingController();
  final idController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  final List<String> yearsList = [
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year',
  ];

  GetStudentResponse? getStudentResponse;

  addStudent({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddStudentLoadingState());

        AddStudentRequest addStudentRequest = AddStudentRequest(
          fullName: fullNameController.text,
          userName: userNameController.text,
          password: passwordController.text,
          nationalId: idController.text,
          yearName: selectedYear,
          deptName: selectedDept,
        );

        var response = await addStudentUseCase.invoke(addStudentRequest, token);

        emit(AddStudentSuccessState(addUserResponse: response));
        fullNameController.clear();
        passwordController.clear();
        idController.clear();
        userNameController.clear();
        selectedYear = null;
        selectedDept = null;
      } on AppError catch (e) {
        emit(AddStudentErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddStudentErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }

  getStudent() async {
    try {
      emit(GetStudentLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');
      var response = await getStudentUseCase.invoke(token ?? '');

      getStudentResponse = response;

      emit(GetStudentSuccessState());
    } on AppError catch (e) {
      emit(GetStudentErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GetStudentErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }

  deleteStudent({required int id}) async {
    try {
      emit(DeleteStudentLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await deleteStudentUseCase.invoke(id, token ?? '');
      emit(DeleteStudentSuccessState(studentResponse: response));
    } on AppError catch (e) {
      emit(DeleteStudentErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DeleteStudentErrorState(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }
}
