import 'package:dio/dio.dart';
import 'package:clean_note_app/common/exception/failure.dart';

mixin DioExceptionMapper {
  Failure mapDioExceptionToFailure(DioException e, StackTrace stackTrace) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(
          message: "Connection timeout with API server. Please try again later",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.sendTimeout:
        return Failure(
          message:
              "Send timeout with API server. Check your internet connection and try again",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.receiveTimeout:
        return Failure(
          message:
              "Receive timeout with API server. Check your internet connection and try again",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.badCertificate:
        return Failure(
          message: "Bad certificate with API server. Please try again later",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.badResponse:
        return Failure(
          message: _getErrorMessageForStatusCode(e.response?.statusCode,e),
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.cancel:
        return Failure(
          message: "Request to API server was cancelled",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.connectionError:
        return Failure(
          message: "خطاء في الوصول للمخدم!\n تأكد من اتصالك بالانترنت.",
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.unknown:
        return Failure(
          message: "Unknown error occurred. Please try again later",
          exception: e,
          stackTrace: stackTrace,
        );
    }
  }
}

String _getErrorMessageForStatusCode(int? statusCode, DioException e) {
  switch (statusCode) {
    case 400:
      return e.response!.data["msg"];
    case 401:
      return "Unauthorized. Please try again later";
    case 403:
      return "Forbidden. Please try again later";
    case 404:
      return "Not found. Please try again later";
    case 498:
      return "Refresh token expired. Please try again later";
    case 500:
      return "Internal server error. Please try again later";
    case 503:
      return "Service unavailable. Please try again later";
    default:
      return "Unknown error";
  }
}
