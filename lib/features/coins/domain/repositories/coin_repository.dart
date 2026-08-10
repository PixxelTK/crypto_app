import '../entities/coin.dart';

abstract interface class CoinRepository {
  Future<({List<Coin> coins, String? nextCursor})> getCoins({
    String? cursor,
    required int limit,
  });
}
