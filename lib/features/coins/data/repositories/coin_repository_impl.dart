import 'package:crypto_app/features/coins/data/sources/coin_data_source.dart';

import '../../domain/entities/coin.dart';
import '../../domain/repositories/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository {
  CoinRepositoryImpl(this.dataSource);

  final CoinDataSource dataSource;

  @override
  Future<({List<Coin> coins, String? nextCursor})> getCoins({
    String? cursor,
    required int limit,
  }) async {
    final result = await dataSource.getCoins(cursor: cursor, limit: limit);

    final coins = result.coins.map((model) => model.toEntity()).toList();
    return (coins: coins, nextCursor: result.nextCursor);
  }
}
