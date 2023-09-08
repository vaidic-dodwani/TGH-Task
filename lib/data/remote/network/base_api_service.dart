import 'dart:io';

abstract class BaseApiService {
  final String baseUrl =
      "https://google-translate1.p.rapidapi.com/language/translate/v2";
  //
  final Map<String, String> header = {
    'X-RapidAPI-Key': '5b0bd6a96cmsh37fb1e8bc261d05p1f3e6fjsnde2b5ea27e23',
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  };

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, Map<String, dynamic> jsonBody);
}
