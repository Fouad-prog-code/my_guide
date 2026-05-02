import 'package:my_guide/api/models/common/update_or_delete_object/update_or_delete_object_response_dto.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

extension UpdateOrDeleteUserResponseMapper on UpdateOrDeleteObjectResponseDto {
  UpdateOrDeleteObjectResponse toUpdateOrDeleteObjectResponse() {
    return UpdateOrDeleteObjectResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      data: data,
      errors: errors,
      meta: meta,
    );
  }
}
