import 'package:dio/dio.dart';

import '../errors/errors_model.dart';
import '../errors/exceptions.dart';

ServerExceptions handleDioErrors(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      return ServerExceptions(
          errorsModel: ErrorsModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad Request
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 401: //unauthorized
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 403: //forbidden
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 404: //not found
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 409: //cofficient
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 422: // unProcessable entity
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));

        case 504: //server Exceptions
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));
        default:
          return ServerExceptions(
              errorsModel: ErrorsModel.fromJson(e.response!.data));
      }
  }
}
