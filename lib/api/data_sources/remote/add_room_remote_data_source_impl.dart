import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/add_room_request_mapper.dart';
import 'package:my_guide/api/mappers/add_room_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/add_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';

@Injectable(as: AddRoomRemoteDataSource)
class AddRoomRemoteDataSourceImpl implements AddRoomRemoteDataSource {
  ApiServices apiServices;

  AddRoomRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddRoomResponse> addRoom(
    AddRoomRequest addRoomRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.addRoom(
        addRoomRequest.toAddRoomRequestDto(),
        'Bearer $token',
      );

      return response.toAddRoomResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;

      throw ServerError(errorMessage: message);
    }
  }
}
