import 'package:my_guide/api/models/response/get_manager/get_manager_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_data.dart';

extension GetManagerDataMapper on GetManagerDataDto {
  GetManagerData toGetManagerData() {
    return GetManagerData(
      managerId: managerId,
      fullName: fullName,
      userName: userName,
      nationalId: nationalId,
    );
  }
}
