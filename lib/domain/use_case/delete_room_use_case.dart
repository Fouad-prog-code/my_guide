import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';
import 'package:my_guide/domain/repositories/delete_room_repository.dart';

@injectable
class DeleteRoomUseCase {
  DeleteRoomRepository deleteRoomRepository;

  DeleteRoomUseCase({required this.deleteRoomRepository});

  Future<DeleteRoomResponse> invoke(int id, String token) {
    return deleteRoomRepository.deleteRoom(id, token);
  }
}
