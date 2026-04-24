import 'package:json_annotation/json_annotation.dart';

part 'update_doctor_request_dto.g.dart';

@JsonSerializable()
class UpdateDoctorRequestDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "nationalId")
  final String? nationalId;
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "password")
  final String? password;

  UpdateDoctorRequestDto ({
    this.id,
    this.nationalId,
    this.fullName,
    this.username,
    this.password,
  });

  factory UpdateDoctorRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateDoctorRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateDoctorRequestDtoToJson(this);
  }
}


