class ApiEndpoints {
  ApiEndpoints._();

  static const String coins = '/v2/coins';

  static String coinDetail(String uuid) {
    return '/v2/coin/$uuid';
  }
}
