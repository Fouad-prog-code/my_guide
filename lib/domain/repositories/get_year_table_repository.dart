import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';

abstract class GetYearTableRepository {
  Future<YearTableResponse> getYearTable(String token);
}
