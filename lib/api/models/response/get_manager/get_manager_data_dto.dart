import 'package:json_annotation/json_annotation.dart';

part 'get_manager_data_dto.g.dart';

@JsonSerializable()
class GetManagerDataDto {
  @JsonKey(name: "managerId")
  final int? managerId;
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "nationalId")
  final String? nationalId;

  GetManagerDataDto({
    this.managerId,
    this.fullName,
    this.userName,
    this.nationalId,
  });

  factory GetManagerDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetManagerDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetManagerDataDtoToJson(this);
  }
}
