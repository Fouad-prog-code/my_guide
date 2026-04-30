import 'package:json_annotation/json_annotation.dart';
part 'get_doctor_data_dto.g.dart';

@JsonSerializable()
class GetDoctorDataDto {
  @JsonKey(name: "doctorName")
  final String? doctorName;
  @JsonKey(name: "doctorId")
  final int? doctorId;
  @JsonKey(name: "nationalId")
  final String? nationalId;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "lectures")
  final List<String>? lectures;

  GetDoctorDataDto({
    this.doctorName,
    this.doctorId,
    this.nationalId,
    this.userName,
    this.lectures,
  });

  factory GetDoctorDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetDoctorDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDoctorDataDtoToJson(this);
  }
}
