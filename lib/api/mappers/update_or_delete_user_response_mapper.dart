import 'package:my_guide/api/models/common/update_or_delete_user/update_or_delete_user_response_dto.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

extension UpdateOrDeleteUserResponseMapper on UpdateOrDeleteUserResponseDto {
  UpdateOrDeleteUserResponse toUpdateOrDeleteUserResponse() {
    return UpdateOrDeleteUserResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      data: data,
      errors: errors,
      meta: meta,
    );
  }
}
