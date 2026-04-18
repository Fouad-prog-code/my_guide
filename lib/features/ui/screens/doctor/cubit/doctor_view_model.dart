import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/features/ui/screens/doctor/cubit/doctor_states.dart';

class DoctorViewModel extends Cubit<DoctorStates> {
  DoctorViewModel() : super(DoctorLoadingState());
}
