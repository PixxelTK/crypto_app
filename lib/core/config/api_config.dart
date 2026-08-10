class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'https://api.coinranking.com';

  // flutter run --dart-define=API_KEY=xxxx
  static const String apiKey = String.fromEnvironment('API_KEY');
}
