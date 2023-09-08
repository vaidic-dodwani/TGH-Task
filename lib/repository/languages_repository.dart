import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/network_api_service.dart';

abstract class _LanguageAbstract {
  Future<dynamic> getLanguages();
  Future<dynamic> translate(Map<String, dynamic> body);
}

class LanguageRepository extends _LanguageAbstract {
  final _apiService = NetworkApiService();

  @override
  Future<dynamic> getLanguages() async {
    try {
      final resp = await _apiService.getResponse(
        ApiLinks.detectUrl,
      );
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> translate(Map<String, dynamic> body) async {
    try {
      final resp = await _apiService.postResponse(ApiLinks.translateUrl, body);
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
