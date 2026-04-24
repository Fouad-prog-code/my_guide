import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/delete_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

@Injectable(as: DeleteStudentRemoteDataSource)
class DeleteStudentRemoteDataSourceImpl
    implements DeleteStudentRemoteDataSource {
  ApiServices apiServices;

  DeleteStudentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteUserResponse> deleteStudent(int id, String token) async {
    try {
      var response = await apiServices.deleteStudent(id, 'Bearer $token');
      return response.toUpdateOrDeleteUserResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
