import 'package:my_guide/api/models/response/delete_doctor/delete_doctor_data_dto.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_data.dart';

extension DeleteDoctorDataMapper on DeleteDoctorDataDto {
  DeleteDoctorData toDeleteDoctorData() {
    return DeleteDoctorData(
      message: message,
      orphanedSubjects: orphanedSubjects,
    );
  }
}
