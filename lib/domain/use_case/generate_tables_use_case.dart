import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';
import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';
import 'package:my_guide/domain/repositories/generate_tables_repository.dart';

@injectable
class GenerateTablesUseCase {
  GenerateTablesRepository generateTablesRepository;

  GenerateTablesUseCase({required this.generateTablesRepository});

  Future<GenerateTablesResponse> invoke(
    GenerateTablesRequest generateTablesRequest,
    String token,
  ) {
    return generateTablesRepository.generateTables(
      generateTablesRequest,
      token,
    );
  }
}
