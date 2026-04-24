import 'package:json_annotation/json_annotation.dart';

part 'update_room_request_dto.g.dart';

@JsonSerializable()
class UpdateRoomRequestDto {
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "roomId")
  final int? roomId;
  @JsonKey(name: "capacity")
  final int? capacity;
  @JsonKey(name: "location")
  final String? location;

  UpdateRoomRequestDto ({
    this.roomName,
    this.roomId,
    this.capacity,
    this.location,
  });

  factory UpdateRoomRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateRoomRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateRoomRequestDtoToJson(this);
  }
}


