import 'package:my_guide/domain/entities/response/doctor/doctor_lectures.dart';

class DoctorData {
  final String? dayName;

  final int? lecturesCount;

  final List<DoctorLectures>? lectures;

  DoctorData({this.dayName, this.lecturesCount, this.lectures});
}
