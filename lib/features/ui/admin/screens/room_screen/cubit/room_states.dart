import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';
import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';

abstract class RoomStates {}

class RoomInitState extends RoomStates {}

class AddRoomLoadingState extends RoomStates {}

class AddRoomErrorState extends RoomStates {
  String message;

  AddRoomErrorState({required this.message});
}

class AddRoomSuccessState extends RoomStates {
  AddRoomResponse addRoomResponse;

  AddRoomSuccessState({required this.addRoomResponse});
}

class GetRoomLoadingState extends RoomStates {}

class GetRoomErrorState extends RoomStates {
  String message;

  GetRoomErrorState({required this.message});
}

class GetRoomSuccessState extends RoomStates {}

class UpdateRoomLoadingState extends RoomStates {}

class UpdateRoomErrorState extends RoomStates {
  String message;

  UpdateRoomErrorState({required this.message});
}

class UpdateRoomSuccessState extends RoomStates {
  UpdateRoomResponse updateRoomResponse;

  UpdateRoomSuccessState({required this.updateRoomResponse});
}

class DeleteRoomLoadingState extends RoomStates {}

class DeleteRoomErrorState extends RoomStates {
  String message;

  DeleteRoomErrorState({required this.message});
}

class DeleteRoomSuccessState extends RoomStates {
  DeleteRoomResponse deleteRoomResponse;

  DeleteRoomSuccessState({required this.deleteRoomResponse});
}
