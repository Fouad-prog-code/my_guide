import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_student/view_student_dots_dto.dart';
part 'get_student_data_dto.g.dart';

@JsonSerializable()
class GetStudentDataDto {
  @JsonKey(name: "yearName")
  final String? yearName;
  @JsonKey(name: "viewStudentDtos")
  final List<ViewStudentDtosDto>? viewStudentDtos;

  GetStudentDataDto({this.yearName, this.viewStudentDtos});

  factory GetStudentDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetStudentDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetStudentDataDtoToJson(this);
  }
}
