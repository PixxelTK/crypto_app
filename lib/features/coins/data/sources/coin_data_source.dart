import 'package:crypto_app/core/network/api_endpoints.dart';
import 'package:crypto_app/features/coins/data/models/coin_model.dart';

import '../../../../core/network/api_client.dart';

class CoinDataSource {
  CoinDataSource(this.apiClient);

  final ApiClient apiClient;

  Future<({List<CoinModel> coins, String? nextCursor})> getCoins({
    String? cursor,
    required int limit,
  }) async {
    final response = await apiClient.get(
      ApiEndpoints.coins,
      queryParameters: {'cursor': ?cursor, 'limit': limit},
    );

    final data = response['data'] as Map<String, dynamic>;
    final coinsList = data['coins'] as List<dynamic>;

    final coins = coinsList
        .map((json) => CoinModel.fromJson(json as Map<String, dynamic>))
        .toList();

    final pagination = response['pagination'] as Map<String, dynamic>?;
    final nextCursor = pagination?['nextCursor'] as String?;

    return (coins: coins, nextCursor: nextCursor);
  }
}
