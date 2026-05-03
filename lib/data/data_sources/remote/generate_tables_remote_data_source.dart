import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';
import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';

abstract class GenerateTablesRemoteDataSource {
  Future<GenerateTablesResponse> generateTables(
    GenerateTablesRequest generateTablesRequest,
    String token,
  );
}
