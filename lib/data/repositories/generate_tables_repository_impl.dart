import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/generate_tables_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';
import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';
import 'package:my_guide/domain/repositories/generate_tables_repository.dart';

@Injectable(as: GenerateTablesRepository)
class GenerateTablesRepositoryImpl implements GenerateTablesRepository {
  GenerateTablesRemoteDataSource generateTablesRemoteDataSource;

  GenerateTablesRepositoryImpl({required this.generateTablesRemoteDataSource});
  @override
  Future<GenerateTablesResponse> generateTables(
    GenerateTablesRequest generateTablesRequest,
    String token,
  ) {
    return generateTablesRemoteDataSource.generateTables(
      generateTablesRequest,
      token,
    );
  }
}
