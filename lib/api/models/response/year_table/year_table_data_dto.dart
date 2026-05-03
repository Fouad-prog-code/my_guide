import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/year_table/year_table_schedule_dto.dart';
part 'year_table_data_dto.g.dart';

@JsonSerializable()
class YearTableDataDto {
  @JsonKey(name: "yearId")
  final int? yearId;
  @JsonKey(name: "yearName")
  final String? yearName;
  @JsonKey(name: "schedules")
  final List<YearTableScheduleDto>? schedules;

  YearTableDataDto({this.yearId, this.yearName, this.schedules});

  factory YearTableDataDto.fromJson(Map<String, dynamic> json) {
    return _$YearTableDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$YearTableDataDtoToJson(this);
  }
}
