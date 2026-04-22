import 'package:json_annotation/json_annotation.dart';

part 'add_room_request_dto.g.dart';

@JsonSerializable()
class AddRoomRequestDto {
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "capacity")
  final int? capacity;
  @JsonKey(name: "location")
  final String? location;

  AddRoomRequestDto ({
    this.roomName,
    this.capacity,
    this.location,
  });

  factory AddRoomRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddRoomRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddRoomRequestDtoToJson(this);
  }
}


