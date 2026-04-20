import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/doctor/doctor_lectures_dto.dart';

part 'doctor_data_dto.g.dart';

@JsonSerializable()
class DoctorDataDto {
  @JsonKey(name: "dayName")
  final String? dayName;
  @JsonKey(name: "lecturesCount")
  final int? lecturesCount;
  @JsonKey(name: "lectures")
  final List<DoctorLecturesDto>? lectures;

  DoctorDataDto({this.dayName, this.lecturesCount, this.lectures});

  factory DoctorDataDto.fromJson(Map<String, dynamic> json) {
    return _$DoctorDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DoctorDataDtoToJson(this);
  }
}
