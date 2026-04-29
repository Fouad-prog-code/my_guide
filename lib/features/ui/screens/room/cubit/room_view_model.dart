import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/use_case/rooms_use_case.dart';
import 'package:my_guide/features/ui/screens/room/cubit/room_state_model.dart';

@injectable
class RoomViewModel extends Cubit<RoomStates> {
  RoomUseCase roomUseCase;
  RoomViewModel({required this.roomUseCase}) : super(RoomLoadingState());
  void getRooms() async {
    try {
      emit(RoomLoadingState());
      String? token = await SharedPreferencesUtils.getData(key: 'token');
      var response = await roomUseCase.invoke(token ?? '');
      emit(RoomSuccessState(roomResponse: response));
    } on AppError catch (e) {
      emit(RoomErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        RoomErrorState(errorMessage: message ?? 'An unexpected error occurred'),
      );
    }
  }
}
