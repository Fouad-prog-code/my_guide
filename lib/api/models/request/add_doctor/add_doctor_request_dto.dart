import 'package:json_annotation/json_annotation.dart';

part 'add_doctor_request_dto.g.dart';

@JsonSerializable()
class AddDoctorRequestDto {
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "nationalId")
  final String? nationalId;

  AddDoctorRequestDto ({
    this.userName,
    this.password,
    this.fullName,
    this.nationalId,
  });

  factory AddDoctorRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddDoctorRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDoctorRequestDtoToJson(this);
  }
}


