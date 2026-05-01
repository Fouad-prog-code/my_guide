import 'package:my_guide/api/models/request/update_manager/update_manager_request_dto.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

extension UpdateManagerRequestMapper on UpdateManagerRequest {
  UpdateManagerRequestDto toUpdateManagerRequestDto() {
    return UpdateManagerRequestDto(
      managerId: managerId,
      fullName: fullName,
      userName: userName,
      nationalId: nationalId,
    );
  }
}
