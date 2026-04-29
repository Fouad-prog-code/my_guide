import 'package:my_guide/api/mappers/student_day_mapper.dart';
import 'package:my_guide/api/models/response/student_schedule_response_dto.dart';
import 'package:my_guide/domain/entities/response/student_schedule_response.dart';

extension StudentScheduleResponseMapper on StudentScheduleResponseDto {
  StudentScheduleResponse toStudentScheduleResponse() {
    return StudentScheduleResponse(
      succeeded: succeeded,
      message: message,
      data: data?.map((e) => e.toStudentDay()).toList() ?? [],
      errors: errors,
      statusCode: statusCode,
      meta: meta,
    );
  }
}
