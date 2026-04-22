import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/common/add_user/add_user_data_dto.dart';

part 'add_user_response_dto.g.dart';

@JsonSerializable()
class AddUserResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final AddUserDataDto? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  AddUserResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory AddUserResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddUserResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddUserResponseDtoToJson(this);
  }
}
