import 'package:my_guide/api/models/response/delete_subject/delete_subject_response_dto.dart';
import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';

extension DeleteSubjectResponseMapper on DeleteSubjectResponseDto {
  DeleteSubjectResponse toDeleteSubjectResponse() {
    return DeleteSubjectResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      data: data,
      errors: errors,
      message: message,
      meta: meta,
    );
  }
}
