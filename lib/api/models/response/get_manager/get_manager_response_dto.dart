import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_manager/get_manager_data_dto.dart';

part 'get_manager_response_dto.g.dart';

@JsonSerializable()
class GetManagerResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "value") // In Postman ManagerManagment response uses "value", but sometimes standard response uses "data". Let's map both or just use "value" if the schema is like RoomManagment.
  // Wait! Let's check get_room_response_dto.dart to see how they mapped RoomManagment.
  final List<GetManagerDataDto>? value;
  
  // Wait, let me check other responses like get_doctor_response_dto.dart. It has "data" not "value".
  // But wait, RoomManagment had "value" and "hasValue". Let me check get_room_response_dto.dart first before writing this! I will write it as `value` and `hasValue` for now, then check it and modify.
  @JsonKey(name: "hasValue")
  final bool? hasValue;

  @JsonKey(name: "data")
  final List<GetManagerDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  GetManagerResponseDto({
    this.succeeded,
    this.message,
    this.value,
    this.hasValue,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GetManagerResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetManagerResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetManagerResponseDtoToJson(this);
  }
}
