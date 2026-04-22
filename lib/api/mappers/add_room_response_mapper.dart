import 'package:my_guide/api/models/response/add_room/add_room_response_dto.dart';
import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';

extension AddRoomResponseMapper on AddRoomResponseDto {
  AddRoomResponse toAddRoomResponse() {
    return AddRoomResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      data: data,
      meta: message,
      errors: errors,
    );
  }
}
