class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'https://api.coinranking.com';

  static const String apiKey = String.fromEnvironment('API_KEY');
}
