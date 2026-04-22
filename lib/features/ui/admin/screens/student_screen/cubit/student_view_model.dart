import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';
import 'package:my_guide/domain/use_case/add_student_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/cubit/student_states.dart';

@injectable
class StudentViewModel extends Cubit<StudentStates> {
  AddStudentUseCase addStudentUseCase;

  StudentViewModel({required this.addStudentUseCase})
    : super(StudentInitState());

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

  addStudent({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(StudentLoadingState());

        AddStudentRequest addStudentRequest = AddStudentRequest(
          fullName: fullNameController.text,
          userName: userNameController.text,
          password: passwordController.text,
          nationalId: idController.text,
          yearName: selectedYear,
          deptName: selectedDept,
        );

        var response = await addStudentUseCase.invoke(addStudentRequest, token);

        emit(StudentSuccessState(addUserResponse: response));
      } on AppError catch (e) {
        emit(StudentErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          StudentErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }
}
