import 'package:my_guide/api/models/response/delete_room/delete_room_response_dto.dart';
import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';

extension DeleteRoomResponseMapper on DeleteRoomResponseDto {
  DeleteRoomResponse toDeleteRoomResponse() {
    return DeleteRoomResponse(
      statusCode: statusCode,
      succeeded: succeeded,
      message: message,
      data: data,
      errors: errors,
      meta: meta,
    );
  }
}
