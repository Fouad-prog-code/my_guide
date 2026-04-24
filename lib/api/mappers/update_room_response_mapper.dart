import 'package:my_guide/api/models/response/updata_room/update_room_response_dto.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';

extension UpdateRoomResponseMapper on UpdateRoomResponseDto {
  UpdateRoomResponse toUpdateRoomResponse() {
    return UpdateRoomResponse(
      statusCode: statusCode,
      succeeded: succeeded,
      message: message,
      meta: meta,
      data: data,
      errors: errors,
    );
  }
}
