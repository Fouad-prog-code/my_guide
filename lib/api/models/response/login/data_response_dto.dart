import 'package:json_annotation/json_annotation.dart';

part 'data_response_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "token")
  final String? token;

  DataDto({this.fullName, this.userName, this.token});

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
