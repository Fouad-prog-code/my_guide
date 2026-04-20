import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "password")
  final String? password;

  LoginRequestDto ({
    this.userName,
    this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestDtoToJson(this);
  }
}


