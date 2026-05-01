import 'package:json_annotation/json_annotation.dart';

part 'update_manager_request_dto.g.dart';

@JsonSerializable()
class UpdateManagerRequestDto {
  @JsonKey(name: "managerId")
  final int managerId;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "userName")
  final String userName;
  @JsonKey(name: "nationalId")
  final String nationalId;

  UpdateManagerRequestDto({
    required this.managerId,
    required this.fullName,
    required this.userName,
    required this.nationalId,
  });

  factory UpdateManagerRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateManagerRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateManagerRequestDtoToJson(this);
  }
}
