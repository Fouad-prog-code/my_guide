import 'package:my_guide/api/models/response/add_subject/add_subject_response_dto.dart';
import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';

extension AddSubjectResponseMapper on AddSubjectResponseDto {
  AddSubjectResponse toAddSubjectResponse() {
    return AddSubjectResponse(
      succeeded: succeeded,
      message: message,
      data: data,
      errors: errors,
      statusCode: statusCode,
      meta: meta,
    );
  }
}
