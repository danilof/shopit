import 'package:dio/dio.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/services/environment_service.dart';

final log = getLogger("DioInterceptor");

class DioInterceptor extends Interceptor {
  final Dio dio;
  DioInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    if (EnvironmentService.apiLoggerRequestEnabled) {
      log.d('[ URL: ${options.baseUrl}${options.path} ]');
      log.d('[ Headers: ${options.headers.toString()} ]');
      log.d('[ Request: ${options.data.toString()} ]');
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    if (EnvironmentService.apiLoggerResponseEnabled) {
      log.d('[ Response: ${response.data} ]');
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.e('[ Error ] ${err.toString()}');
    log.e('[ Error Response] ${err.response.toString()}');
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
          case 403:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (err.error == null) {
          throw NoInternetConnectionException(err.requestOptions);
        }
        throw UnknownRequestException(err.requestOptions, err.error.toString());
      case DioExceptionType.badCertificate:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
    }
    return handler.next(err);
  }
}

class UnknownRequestException extends DioException {
  UnknownRequestException(RequestOptions r, String error)
      : super(requestOptions: r);

  @override
  String toString() {
    return error.toString();
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_invalid_request").toString();
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_unknown").toString();
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_conflict").toString();
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_unauthorized").toString();
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_not_found").toString();
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations
        .text("api_exception_no_internet_connection")
        .toString();
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return allTranslations.text("api_exception_time_out").toString();
  }
}
