import 'package:crypto_app/features/coins/sources/coin_data_source.dart';
import 'package:crypto_app/features/coins/models/coin_details.dart';

import '../models/coin.dart';

class CoinRepository {
  CoinRepository(this.dataSource);

  final CoinDataSource dataSource;

  Future<({List<Coin> coins, String? nextCursor})> getCoins({
    String? cursor,
    String? search,
    required int limit,
  }) async {
    final result = await dataSource.getCoins(
      cursor: cursor,
      search: search,
      limit: limit,
    );

    final coins = result.coins.map((model) => model.toEntity()).toList();
    return (coins: coins, nextCursor: result.nextCursor);
  }

  Future<CoinDetails> getCoinDetails(String uuid) async {
    final result = await dataSource.getCoinDetails(uuid);
    return result.toEntity();
  }
}
