import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';
import 'package:my_guide/domain/repositories/get_year_table_repository.dart';

@injectable
class GetYearTableUseCase {
  GetYearTableRepository getYearTableRepository;

  GetYearTableUseCase({required this.getYearTableRepository});

  Future<YearTableResponse> invoke(String token) {
    return getYearTableRepository.getYearTable(token);
  }
}
