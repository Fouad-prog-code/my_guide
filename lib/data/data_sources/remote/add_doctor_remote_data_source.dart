import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';

abstract class AddDoctorRemoteDataSource {
  Future<AddUserResponse> addDoctor(
    AddDoctorRequest addDoctorRequest,
    String token,
  );
}
