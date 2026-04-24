import 'package:my_guide/api/models/response/get_doctor/get_doctor_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_data.dart';

extension GetDoctorDataMapper on GetDoctorDataDto {
  GetDoctorData toGetDoctorData() {
    return GetDoctorData(
      doctorId: doctorId,
      doctorName: doctorName,
      lectures: lectures,
    );
  }
}
