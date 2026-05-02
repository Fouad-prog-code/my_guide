import 'package:my_guide/api/models/response/get_department/get_department_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_data.dart';

extension GetDepartmentDataMapper on GetDepartmentDataDto {
  GetDepartmentData toGetDepartmentData() {
    return GetDepartmentData(
      departmentId: departmentId,
      departmentName: departmentName,
      departmentCode: departmentCode,
    );
  }
}
