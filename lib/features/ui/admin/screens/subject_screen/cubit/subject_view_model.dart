import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';
import 'package:my_guide/domain/use_case/add_subject_use_case.dart';
import 'package:my_guide/domain/use_case/delete_subject_use_case.dart';
import 'package:my_guide/domain/use_case/get_subject_use_case.dart';
import 'package:my_guide/domain/use_case/update_course_use_case.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_states.dart';

@injectable
class SubjectViewModel extends Cubit<SubjectStates> {
  AddSubjectUseCase addSubjectUseCase;
  GetSubjectUseCase getSubjectUseCase;
  DeleteSubjectUseCase deleteSubjectUseCase;
  UpdateCourseUseCase updateCourseUseCase;

  SubjectViewModel({
    required this.addSubjectUseCase,
    required this.getSubjectUseCase,
    required this.deleteSubjectUseCase,
    required this.updateCourseUseCase,
  }) : super(SubjectInitState());

  GlobalKey<FormState> formKey = GlobalKey();
  String? selectedYear;
  int? selectedDoctorId;

  GetSubjectResponse? getSubjectResponse;

  addSubject({
    required String token,
    required AddSubjectRequest addSubjectRequest,
  }) async {
    if (formKey.currentState!.validate() &&
        selectedYear != null &&
        selectedDoctorId != null) {
      try {
        emit(AddSubjectLoadingState());

        var response = await addSubjectUseCase.invoke(
          addSubjectRequest: addSubjectRequest,
          token: token,
        );
        emit(AddSubjectSuccessState(addSubjectResponse: response));
      } on AppError catch (e) {
        emit(AddSubjectErrorState(addSubjectmessage: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddSubjectErrorState(
            addSubjectmessage: message ?? 'UnExpected Error Occures',
          ),
        );
      }
    }
  }

  getSubject() async {
    try {
      emit(GetSubjectLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await getSubjectUseCase.invoke(token ?? '');
      getSubjectResponse = response;
      emit(GetSubjectSuccessState());
    } on AppError catch (e) {
      emit(GetSubjectErrorState(getSubjectmessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        GetSubjectErrorState(
          getSubjectmessage: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  deleteSubject({required String name}) async {
    try {
      emit(DeleteSubjectLoadingState());
      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await deleteSubjectUseCase.invoke(name, token ?? '');

      emit(DeleteSubjectSuccessState(deleteSubjectResponse: response));
    } on AppError catch (e) {
      emit(DeleteSubjectErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DeleteSubjectErrorState(
          message: message ?? 'UnExpected error occurred',
        ),
      );
    }
  }

  updateCourse({required UpdateCourseRequest updateCourseRequest}) async {
    try {
      emit(UpdateCourseLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await updateCourseUseCase.invoke(
        updateCourseRequest,
        token ?? '',
      );

      emit(UpdateCourseSuccessState(response: response));
    } on AppError catch (e) {
      emit(UpdateCourseErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        UpdateCourseErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }
}
