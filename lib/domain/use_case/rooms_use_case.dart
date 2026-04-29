import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/room_response.dart';
import 'package:my_guide/domain/repositories/room_/room_repository.dart';

@injectable
class RoomUseCase {
  RoomRepository roomRepository;
  RoomUseCase({required this.roomRepository});
  Future<RoomResponse> invoke(String token) {
    return roomRepository.getRooms(token);
  }
}
