import 'package:json_annotation/json_annotation.dart';

part 'update_or_delete_object_response_dto.g.dart';

@JsonSerializable()
class UpdateOrDeleteObjectResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  UpdateOrDeleteObjectResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory UpdateOrDeleteObjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateOrDeleteObjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateOrDeleteObjectResponseDtoToJson(this);
  }
}
