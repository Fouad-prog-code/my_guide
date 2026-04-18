abstract class DoctorStates {}

class DoctorLoadingState extends DoctorStates {}

class DoctorErrorState extends DoctorStates {
  String message;
  DoctorErrorState({required this.message});
}

class DoctorSuccessState extends DoctorStates {}
