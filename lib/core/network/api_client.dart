import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({required this._baseUrl, required this._apiKey});

  final String _baseUrl;
  final String _apiKey;

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = Uri.parse('$_baseUrl$path').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await http.get(uri, headers: {'x-access-token': _apiKey});

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
