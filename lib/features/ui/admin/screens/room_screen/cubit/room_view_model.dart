import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_response.dart';
import 'package:my_guide/domain/use_case/add_room_use_case.dart';
import 'package:my_guide/domain/use_case/delete_room_use_case.dart';
import 'package:my_guide/domain/use_case/get_room_use_case.dart';
import 'package:my_guide/domain/use_case/update_room_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_states.dart';

@injectable
class RoomViewModel extends Cubit<RoomStates> {
  AddRoomUseCase addRoomUseCase;
  GetRoomUseCase getRoomUseCase;
  UpdateRoomUseCase updateRoomUseCase;
  DeleteRoomUseCase deleteRoomUseCase;

  RoomViewModel({
    required this.addRoomUseCase,
    required this.getRoomUseCase,
    required this.updateRoomUseCase,
    required this.deleteRoomUseCase,
  }) : super(RoomInitState());

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final capacityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  GetRoomResponse? getRoomResponse;

  addRoom({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddRoomLoadingState());

        AddRoomRequest addRoomRequest = AddRoomRequest(
          roomName: nameController.text,
          location: locationController.text,
          capacity: int.parse(capacityController.text),
        );

        var response = await addRoomUseCase.invoke(
          addRoomRequest: addRoomRequest,
          token: token,
        );

        emit(AddRoomSuccessState(addRoomResponse: response));
        nameController.clear();
        capacityController.clear();
        locationController.clear();
      } on AppError catch (e) {
        emit(AddRoomErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          AddRoomErrorState(message: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }

  getRoom() async {
    try {
      emit(GetRoomLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await getRoomUseCase.invoke(token ?? '');
      getRoomResponse = response;
      emit(GetRoomSuccessState());
    } on AppError catch (e) {
      emit(GetRoomErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(GetRoomErrorState(message: message ?? 'UnExpected error occurred'));
    }
  }

  updateRoom({required UpdateRoomRequest updateRoomRequest}) async {
    try {
      emit(UpdateRoomLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');

      var response = await updateRoomUseCase.invoke(
        updateRoomRequest,
        token ?? '',
      );
      emit(UpdateRoomSuccessState(updateRoomResponse: response));
    } on AppError catch (e) {
      emit(UpdateRoomErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        UpdateRoomErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }

  deleteRoom({required int id}) async {
    try {
      emit(DeleteRoomLoadingState());

      String? token = await SharedPreferencesUtils.getData(key: 'token');
      var response = await deleteRoomUseCase.invoke(id, token ?? '');
      emit(DeleteRoomSuccessState(deleteRoomResponse: response));
    } on AppError catch (e) {
      emit(DeleteRoomErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppError)
          ? (e.error as AppError).errorMessage
          : e.message;
      emit(
        DeleteRoomErrorState(message: message ?? 'UnExpected error occurred'),
      );
    }
  }
}
