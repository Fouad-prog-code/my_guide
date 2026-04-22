import 'package:my_guide/api/models/common/add_user/add_user_data_dto.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_data.dart';

extension AddUserDataMapper on AddUserDataDto {
  AddUserData toAddUserData() {
    return AddUserData(fullName: fullName, userName: userName);
  }
}
