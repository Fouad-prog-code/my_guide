class ApiEndpoints {
  static const String baseUrl = 'http://myguideapi.runasp.net/';
  static const String doctorApi = 'api/Doctor/DoctorSchedule/{DoctorId}';
  static const String studentApi = 'api/Student/StudentSchedule/{StudentId}';
  static const String loginApi = 'api/Account/Login';
  static const String addRoomApi = 'api/Admin/AddRoomAsync';
  static const String addSubjectApi = 'api/Admin/AddLectureAsync';
  static const String addDoctorApi = 'api/Account/Register-Doctor';
  static const String addStudentApi = 'api/Account/Register-Student';
  static const String getSubjectApi = 'api/Admin/SubjectManagment';
  static const String getDoctorApi = 'api/Admin/DoctorsManagment';
  static const String getRoomApi = 'api/Admin/RoomManagment';
  static const String getStudentApi = 'api/Admin/StudentManagment';

  static const String updateRoomApi = 'api/Room/UpdateRoom';

  static const String deleteRoomApi = 'api/Room/DeleteRoom/{Id}';

  static const String updateDoctorApi = 'api/Doctor/updateDoctor';

  static const String deleteStudentApi = 'api/Student/DeleteStudent/{Id}';

  static const String forgetPasswordApi = 'api/Account/ForgetPassword';

  static const String addManagerApi = 'api/Account/RegisterManager';

  static const String roomEndPoint = 'api/Room/ScheduleWithData';
  static const String studentScheduleEndPoint =
      'api/Student/GetMyScheduleAsync';
}
