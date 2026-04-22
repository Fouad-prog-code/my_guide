import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';

abstract class RoomStates {}

class RoomInitState extends RoomStates {}

class RoomLoadingState extends RoomStates {}

class RoomErrorState extends RoomStates {
  String message;

  RoomErrorState({required this.message});
}

class RoomSuccessState extends RoomStates {
  AddRoomResponse addRoomResponse;

  RoomSuccessState({required this.addRoomResponse});
}
