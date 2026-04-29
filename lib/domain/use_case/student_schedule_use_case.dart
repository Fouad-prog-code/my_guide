import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/student_schedule_response.dart';
import 'package:my_guide/domain/repositories/student_/student_repository.dart';

@injectable
class StudentScheduleUseCase {
  StudentRepository studentRepository;
  StudentScheduleUseCase({required this.studentRepository});

  Future<StudentScheduleResponse> invoke(String token) {
    return studentRepository.getStudentSchedule(token);
  }
}
