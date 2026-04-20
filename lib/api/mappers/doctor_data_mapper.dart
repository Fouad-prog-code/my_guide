import 'package:my_guide/api/mappers/doctor_lectures_mapper.dart';
import 'package:my_guide/api/models/response/doctor/doctor_data_dto.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_data.dart';

extension DoctorDataMapper on DoctorDataDto {
  DoctorData toDoctorData() {
    return DoctorData(
      dayName: dayName,
      lecturesCount: lecturesCount,
      lectures: lectures?.map((e) => e.toDoctorLectures()).toList() ?? [],
    );
  }
}
