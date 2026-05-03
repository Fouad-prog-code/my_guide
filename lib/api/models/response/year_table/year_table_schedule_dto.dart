import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/year_table/year_table_lectures_dto.dart';

part 'year_table_schedule_dto.g.dart';

@JsonSerializable()
class YearTableScheduleDto {
  @JsonKey(name: "dayName")
  final String? dayName;
  @JsonKey(name: "lectures")
  final List<YearTableLecturesDto>? lectures;

  YearTableScheduleDto({this.dayName, this.lectures});

  factory YearTableScheduleDto.fromJson(Map<String, dynamic> json) {
    return _$YearTableScheduleDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$YearTableScheduleDtoToJson(this);
  }
}
