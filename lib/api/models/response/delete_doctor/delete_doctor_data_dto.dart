import 'package:json_annotation/json_annotation.dart';
part 'delete_doctor_data_dto.g.dart';

@JsonSerializable()
class DeleteDoctorDataDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "orphanedSubjects")
  final List<String>? orphanedSubjects;

  DeleteDoctorDataDto({this.message, this.orphanedSubjects});

  factory DeleteDoctorDataDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteDoctorDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteDoctorDataDtoToJson(this);
  }
}
