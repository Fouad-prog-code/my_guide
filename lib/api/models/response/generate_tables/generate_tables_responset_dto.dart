import 'package:json_annotation/json_annotation.dart';

part 'generate_tables_responset_dto.g.dart';

@JsonSerializable()
class GenerateTablesResponseDto {
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

  GenerateTablesResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GenerateTablesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GenerateTablesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenerateTablesResponseDtoToJson(this);
  }
}


