import 'dart:io';
import 'keys.env';

abstract class BaseApiService {
  final String baseUrl =
      "https://google-translate1.p.rapidapi.com/language/translate/v2";
  //
  final Map<String, String> header = {
    'X-RapidAPI-Key': rapidApiKey,
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  };

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, Map<String, dynamic> jsonBody);
}
