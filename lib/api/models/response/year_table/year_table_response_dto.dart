import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/year_table/year_table_data_dto.dart';

part 'year_table_response_dto.g.dart';

@JsonSerializable()
class YearTableResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<YearTableDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  YearTableResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory YearTableResponseDto.fromJson(Map<String, dynamic> json) {
    return _$YearTableResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$YearTableResponseDtoToJson(this);
  }
}
