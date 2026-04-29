import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/room_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/room_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/room_response.dart';

@Injectable(as: RoomRemoteDataSource)
class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  ApiServices apiServices;
  RoomRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<RoomResponse> getRooms(String tokens) async {
    try {
      var response = await apiServices.getRooms('Bearer $tokens');
      return response.toRoomResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
