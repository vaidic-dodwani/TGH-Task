import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getResponse(
    String url,
  ) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(baseUrl + url), headers: header)
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
      final response = await http
          .post(Uri.parse(baseUrl + url), body: jsonBody, headers: header)
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);
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
