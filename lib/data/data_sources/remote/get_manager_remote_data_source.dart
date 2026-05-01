import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';

abstract class GetManagerRemoteDataSource {
  Future<GetManagerResponse> getManager(String token);
}
