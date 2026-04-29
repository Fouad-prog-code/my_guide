import 'package:my_guide/domain/entities/response/room_response.dart';

sealed class RoomStates {}

class RoomLoadingState extends RoomStates {}

class RoomErrorState extends RoomStates {
  String errorMessage;
  RoomErrorState({required this.errorMessage});
}

class RoomSuccessState extends RoomStates {
  RoomResponse roomResponse;
  RoomSuccessState({required this.roomResponse});
}
