import 'package:my_guide/domain/entities/response/get_room/get_room_data.dart';

class GetRoomResponse {
  final bool? succeeded;

  final String? message;

  final List<GetRoomData>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  GetRoomResponse({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
}
