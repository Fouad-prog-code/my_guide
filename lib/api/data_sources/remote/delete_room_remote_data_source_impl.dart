import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/delete_room_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/delete_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';

@Injectable(as: DeleteRoomRemoteDataSource)
class DeleteRoomRemoteDataSourceImpl implements DeleteRoomRemoteDataSource {
  ApiServices apiServices;

  DeleteRoomRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<DeleteRoomResponse> deleteRoom(int id, String token) async {
    try {
      var response = await apiServices.deleteRoom(id, 'Bearer $token');
      return response.toDeleteRoomResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
