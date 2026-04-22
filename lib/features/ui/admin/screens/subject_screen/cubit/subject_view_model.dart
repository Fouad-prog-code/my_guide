import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/use_case/add_subject_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/cubit/subject_states.dart';

@injectable
class SubjectViewModel extends Cubit<SubjectStates> {
  AddSubjectUseCase addSubjectUseCase;
  SubjectViewModel({required this.addSubjectUseCase})
    : super(SubjectInitState());

  GlobalKey<FormState> formKey = GlobalKey();
  String? selectedYear;
  int? selectedDoctorId;

  addSubject({
    required String token,
    required AddSubjectRequest addSubjectRequest,
  }) async {
    if (formKey.currentState!.validate() &&
        selectedYear != null &&
        selectedDoctorId != null) {
      try {
        emit(SubjectLoadingState());

        var response = await addSubjectUseCase.invoke(
          addSubjectRequest: addSubjectRequest,
          token: token,
        );
        emit(SubjectSuccessState(addSubjectResponse: response));
      } on AppError catch (e) {
        emit(SubjectErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          SubjectErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }
}
