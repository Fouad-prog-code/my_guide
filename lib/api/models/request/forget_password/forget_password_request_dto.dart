import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "nationalId")
  final String? nationalId;
  @JsonKey(name: "newPassword")
  final String? newPassword;

  ForgetPasswordRequestDto ({
    this.userName,
    this.nationalId,
    this.newPassword,
  });

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordRequestDtoToJson(this);
  }
}


