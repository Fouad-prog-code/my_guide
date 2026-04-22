import 'package:json_annotation/json_annotation.dart';

part 'add_user_data_dto.g.dart';

@JsonSerializable()
class AddUserDataDto {
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "userName")
  final String? userName;

  AddUserDataDto({this.fullName, this.userName});

  factory AddUserDataDto.fromJson(Map<String, dynamic> json) {
    return _$AddUserDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddUserDataDtoToJson(this);
  }
}
