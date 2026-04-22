import 'package:my_guide/api/mappers/common/add_user_data_mapper.dart';
import 'package:my_guide/api/models/common/add_user/add_user_response_dto.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';

extension AddUserResponseMapper on AddUserResponseDto {
  AddUserResponse toAddUserResponse() {
    return AddUserResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      meta: meta,
      data: data!.toAddUserData(),
      errors: errors,
    );
  }
}
