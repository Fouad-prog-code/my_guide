import 'package:my_guide/api/mappers/room_data_mapper.dart';
import 'package:my_guide/api/models/response/room_response_dto.dart';
import 'package:my_guide/domain/entities/response/room_response.dart';

extension RoomResponseMapper on RoomResponseDto {
  RoomResponse toRoomResponse() {
    return RoomResponse(
      errors: errors,
      succeeded: succeeded,
      data: data?.map((e) => e.toRoomData()).toList() ?? [],
      statusCode: statusCode,
      meta: meta,
      message: message,
    );
  }
}
