import 'package:json_annotation/json_annotation.dart';

part 'add_doctor_or_manager_request_dto.g.dart';

@JsonSerializable()
class AddDoctorOrManagerRequestDto {
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "nationalId")
  final String? nationalId;

  AddDoctorOrManagerRequestDto({
    this.userName,
    this.password,
    this.fullName,
    this.nationalId,
  });

  factory AddDoctorOrManagerRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddDoctorOrManagerRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDoctorOrManagerRequestDtoToJson(this);
  }
}
