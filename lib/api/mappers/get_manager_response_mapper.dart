import 'package:my_guide/api/mappers/get_manager_data_mapper.dart';
import 'package:my_guide/api/models/response/get_manager/get_manager_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';

extension GetManagerResponseMapper on GetManagerResponseDto {
  GetManagerResponse toGetManagerResponse() {
    return GetManagerResponse(
      succeeded: succeeded,
      message: message,
      hasValue: hasValue,
      data: data?.map((manager) => manager.toGetManagerData()).toList() ?? [],
      value: value?.map((manager) => manager.toGetManagerData()).toList() ?? [],
    );
  }
}
