import 'package:my_guide/api/mappers/year_table_schedules_mapper.dart';
import 'package:my_guide/api/models/response/year_table/year_table_data_dto.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_data.dart';

extension YearTableDataMapper on YearTableDataDto {
  YearTableData toYearTableData() {
    return YearTableData(
      yearId: yearId,
      yearName: yearName,
      schedules:
          schedules
              ?.map((schedule) => schedule.toYearTableSchedule())
              .toList() ??
          [],
    );
  }
}
