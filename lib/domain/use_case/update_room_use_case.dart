import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';
import 'package:my_guide/domain/repositories/update_room_repository.dart';

@injectable
class UpdateRoomUseCase {
  UpdateRoomRepository updateRoomRepository;

  UpdateRoomUseCase({required this.updateRoomRepository});

  Future<UpdateRoomResponse> invoke(
    UpdateRoomRequest updateRoomRequest,
    String token,
  ) {
    return updateRoomRepository.updateRoom(updateRoomRequest, token);
  }
}
