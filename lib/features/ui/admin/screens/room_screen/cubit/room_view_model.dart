import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/use_case/add_room_use_case.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_states.dart';

@injectable
class RoomViewModel extends Cubit<RoomStates> {
  AddRoomUseCase addRoomUseCase;

  RoomViewModel({required this.addRoomUseCase}) : super(RoomInitState());

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final capacityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  addRoom({required String token}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(RoomLoadingState());

        AddRoomRequest addRoomRequest = AddRoomRequest(
          roomName: nameController.text,
          location: locationController.text,
          capacity: int.parse(capacityController.text),
        );

        var response = await addRoomUseCase.invoke(
          addRoomRequest: addRoomRequest,
          token: token,
        );

        emit(RoomSuccessState(addRoomResponse: response));
      } on AppError catch (e) {
        emit(RoomErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(RoomErrorState(message: message ?? 'UnExpected error occurred'));
      }
    }
  }
}
