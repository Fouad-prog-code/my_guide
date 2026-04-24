import 'package:my_guide/api/mappers/get_room_data_mapper.dart';
import 'package:my_guide/api/models/response/get_room/get_room_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_response.dart';

extension GetRoomResponseMapper on GetRoomResponseDto {
  GetRoomResponse toGetRoomResponse() {
    return GetRoomResponse(
      message: message,
      meta: meta,
      statusCode: statusCode,
      succeeded: succeeded,
      errors: errors,
      data: data?.map((room) => room.toGetRoomData()).toList() ?? [],
    );
  }
}
