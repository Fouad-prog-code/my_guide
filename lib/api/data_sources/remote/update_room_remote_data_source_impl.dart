import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_room_request_mapper.dart';
import 'package:my_guide/api/mappers/update_room_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/update_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';

@Injectable(as: UpdateRoomRemoteDataSource)
class UpdateRoomRemoteDataSourceImpl implements UpdateRoomRemoteDataSource {
  ApiServices apiServices;

  UpdateRoomRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateRoomResponse> updateRoom(
    UpdateRoomRequest updateRoomRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.updateRoom(
        updateRoomRequest.toUpdateRoomRequestDto(),
        'Bearer $token',
      );

      return response.toUpdateRoomResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
