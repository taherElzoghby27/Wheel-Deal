import 'dart:convert';

import 'package:dio/dio.dart';

abstract class FailureServ {
  final String message;

  FailureServ({required this.message});
}

class ServerFailure extends FailureServ {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'badCertification with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
          error.response!.statusCode!,
          error.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to ApiServer was Canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          message: 'Opps There was an Error, Please try again',
        );
    }
  }

  factory ServerFailure.fromDioResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
     // return ServerFailure.fromJson(response);
      return ServerFailure.fromMap(response);
    } else if (statusCode == 404) {
      // return ServerFailure(
      //   message: 'Your request was not found, please try later',
      // );
      return response is Map<String, dynamic>
          ? ServerFailure.fromMap(response)
          : ServerFailure.fromJson(response);
    } else if (statusCode == 500) {
      return ServerFailure(
        message: 'There is a problem with server,please try later',
      );
    }
    return ServerFailure(message: 'there was an error, please try again');
  }

  factory ServerFailure.fromJson(String response) {
    var jsonToMap = jsonDecode(response);
    return jsonToMap is List
        ? ServerFailure.fromListOfMap(
            jsonDecode(response),
          )
        : ServerFailure.fromMap(
            jsonDecode(response),
          );
  }

  factory ServerFailure.fromMap(Map<String, dynamic> response) => ServerFailure(
        message: response['Message'] ?? response['message'],
      );

  factory ServerFailure.fromListOfMap(List<dynamic> response) =>
      ServerFailure(message: response[0]['message'] as String);
}

// class FailureMessage {
//   String? message;
//
//   FailureMessage({required this.message});
//
//   FailureMessage.fromJson(Map<String, dynamic> json) {
//     message = json['Message'] as String;
//   }
// }
