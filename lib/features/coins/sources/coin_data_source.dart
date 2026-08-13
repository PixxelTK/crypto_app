import 'package:crypto_app/core/network/api_endpoints.dart';
import 'package:crypto_app/features/coins/dtos/coin_details_dto.dart';
import 'package:crypto_app/features/coins/dtos/coin_dto.dart';

import '../../../../core/network/api_client.dart';

class CoinDataSource {
  CoinDataSource(this.apiClient);

  final ApiClient apiClient;

  Future<({List<CoinDto> coins, String? nextCursor})> getCoins({
    String? cursor,
    String? search,
    required int limit,
  }) async {
    final queryParameters = <String, dynamic>{
      'cursor': ?cursor,
      if (search != null && search.isNotEmpty) 'search': search,
      'limit': limit,
    };

    final response = await apiClient.get(
      ApiEndpoints.coins,
      queryParameters: queryParameters,
    );

    final data = response['data'] as Map<String, dynamic>;
    final coinsList = data['coins'] as List<dynamic>;

    final coins = coinsList
        .map((json) => CoinDto.fromJson(json as Map<String, dynamic>))
        .toList();

    final pagination = response['pagination'] as Map<String, dynamic>?;
    final nextCursor = pagination?['nextCursor'] as String?;

    return (coins: coins, nextCursor: nextCursor);
  }

  Future<CoinDetailsDto> getCoinDetails(String uuid) async {
    final response = await apiClient.get(ApiEndpoints.coinDetail(uuid));

    final data = response['data'] as Map<String, dynamic>;
    final coinData = data['coin'] as Map<String, dynamic>?;
    if (coinData == null) {
      throw Exception('Coin not found');
    }
    return CoinDetailsDto.fromJson(coinData);
  }
}
