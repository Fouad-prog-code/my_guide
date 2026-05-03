import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_year_table_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';
import 'package:my_guide/domain/repositories/get_year_table_repository.dart';

@Injectable(as: GetYearTableRepository)
class GetYearTableRepositoryImpl implements GetYearTableRepository {
  GetYearTableRemoteDataSource getYearTableRemoteDataSource;

  GetYearTableRepositoryImpl({required this.getYearTableRemoteDataSource});

  @override
  Future<YearTableResponse> getYearTable(String token) {
    return getYearTableRemoteDataSource.getYearTable(token);
  }
}
