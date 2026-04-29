import 'package:my_guide/domain/entities/response/student_schedule_response.dart';

abstract class StudentRepository {
  Future<StudentScheduleResponse> getStudentSchedule(String token);
}
