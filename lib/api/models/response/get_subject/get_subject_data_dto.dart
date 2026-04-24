import 'package:json_annotation/json_annotation.dart';

part 'get_subject_data_dto.g.dart';

@JsonSerializable()
class GetSubjectDataDto {
  @JsonKey(name: "subjectName")
  final String? subjectName;
  @JsonKey(name: "doctorName")
  final String? doctorName;
  @JsonKey(name: "departments")
  final List<String>? departments;

  GetSubjectDataDto({this.subjectName, this.doctorName, this.departments});

  factory GetSubjectDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetSubjectDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSubjectDataDtoToJson(this);
  }
}
