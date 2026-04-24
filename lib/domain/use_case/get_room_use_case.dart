import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_response.dart';
import 'package:my_guide/domain/repositories/get_room_repository.dart';

@injectable
class GetRoomUseCase {
  GetRoomRepository getRoomRepository;

  GetRoomUseCase({required this.getRoomRepository});

  Future<GetRoomResponse> invoke(String token) {
    return getRoomRepository.getRoom(token);
  }
}
