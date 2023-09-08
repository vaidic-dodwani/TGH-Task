import 'dart:io';
import 'package:dio/dio.dart';
import '../app_exception.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  final dio = Dio();

  @override
  Future<dynamic> getResponse(
    String url,
  ) async {
    dynamic responseJson;
    try {
      final response = await dio
          .get(baseUrl + url, options: Options(headers: header))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postResponse(String url, dynamic jsonBody) async {
    dynamic responseJson;
    try {
      final response = await dio
          .post(baseUrl + url,
              data: jsonBody, options: Options(headers: header))
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    dynamic responseJson = response.data;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['error']);
      case 401:
      case 403:
        throw UnauthorisedException(responseJson['error']);
      case 404:
        throw UnauthorisedException(responseJson['error']);
      case 500:
      default:
        throw FetchDataException(responseJson['error']);
    }
  }
}
