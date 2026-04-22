import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';
import 'package:my_guide/domain/repositories/add_room_repository.dart';

@injectable
class AddRoomUseCase {
  AddRoomRepository addRoomRepository;

  AddRoomUseCase({required this.addRoomRepository});

  Future<AddRoomResponse> invoke({
    required AddRoomRequest addRoomRequest,
    required String token,
  }) {
    return addRoomRepository.addRoom(addRoomRequest, token);
  }
}
