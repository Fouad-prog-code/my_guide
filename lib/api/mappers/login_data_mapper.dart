import 'package:my_guide/api/models/response/login/data_response_dto.dart';
import 'package:my_guide/domain/entities/response/login/data_response.dart';

extension LoginDataMapper on DataDto {
  Data toData() {
    return Data(fullName: fullName, userName: userName, token: token);
  }
}
