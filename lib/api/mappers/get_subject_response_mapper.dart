import 'package:my_guide/api/mappers/get_subject_data_mapper.dart';
import 'package:my_guide/api/models/response/get_subject/get_subject_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';

extension GetSubjectResponseMapper on GetSubjectResponseDto {
  GetSubjectResponse toGetSubjectResponse() {
    return GetSubjectResponse(
      succeeded: succeeded,
      message: message,
      data: data?.map((subject) => subject.toGetSubjectData()).toList() ?? [],
      statusCode: statusCode,
      meta: meta,
      errors: errors,
    );
  }
}
