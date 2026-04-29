


import 'data.dart';

class RoomResponse {

  final bool? succeeded;

  final String? message;

  final List<Data>? data;

  final dynamic? errors;

  final int? statusCode;

  final dynamic? meta;

  RoomResponse ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });
  RoomResponse toRoomResponse(){
    return RoomResponse(
      message: message,
      meta: meta,
      statusCode: statusCode,
      data: data,
      succeeded: succeeded,
      errors: errors,
    );
  }

}




