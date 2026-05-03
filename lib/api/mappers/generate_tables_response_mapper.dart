import 'package:my_guide/api/models/response/generate_tables/generate_tables_responset_dto.dart';
import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';

extension GenerateTablesResponseMapper on GenerateTablesResponseDto {
  GenerateTablesResponse toGenerateTablesResponse() {
    return GenerateTablesResponse(
      statusCode: statusCode,
      succeeded: succeeded,
      message: message,
      data: data,
      errors: errors,
      meta: meta,
    );
  }
}
