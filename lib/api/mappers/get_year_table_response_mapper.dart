import 'package:my_guide/api/mappers/year_table_data_mapper.dart';
import 'package:my_guide/api/models/response/year_table/year_table_response_dto.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';

extension GetYearTableResponseMapper on YearTableResponseDto {
  YearTableResponse toYearTableResponse() {
    return YearTableResponse(
      statusCode: statusCode,
      succeeded: succeeded,
      message: message,
      meta: meta,
      errors: errors,
      data: data?.map((d) => d.toYearTableData()).toList() ?? [],
    );
  }
}
