import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';
import 'package:my_guide/domain/repositories/get_manager_repository.dart';

@injectable
class GetManagerUseCase {
  GetManagerRepository repository;

  GetManagerUseCase({required this.repository});

  Future<GetManagerResponse> invoke(String token) {
    return repository.getManager(token);
  }
}
