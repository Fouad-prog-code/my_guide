import 'package:my_guide/domain/entities/response/get_manager/get_manager_data.dart';

class GetManagerResponse {
  final bool? succeeded;
  final String? message;
  final List<GetManagerData>? data;
  final List<GetManagerData>? value;
  final bool? hasValue;

  GetManagerResponse({
    this.succeeded,
    this.message,
    this.data,
    this.value,
    this.hasValue,
  });
}
