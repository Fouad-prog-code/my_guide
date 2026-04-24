import 'package:json_annotation/json_annotation.dart';

part 'get_room_data_dto.g.dart';

@JsonSerializable()
class GetRoomDataDto {
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "roomId")
  final int? roomId;
  @JsonKey(name: "capacity")
  final int? capacity;
  @JsonKey(name: "location")
  final dynamic? location;

  GetRoomDataDto({this.roomName, this.roomId, this.capacity, this.location});

  factory GetRoomDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetRoomDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetRoomDataDtoToJson(this);
  }
}
