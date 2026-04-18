class AppError implements Exception {
  String errorMessage;

  int? statusCode;
  AppError({required this.errorMessage, this.statusCode});
}

class ServerError extends AppError {
  ServerError({required super.errorMessage, super.statusCode});
}

class NetworkError extends AppError {
  NetworkError({required super.errorMessage, super.statusCode});
}

class UnExpectedError extends AppError {
  UnExpectedError({required super.errorMessage, super.statusCode});
}
