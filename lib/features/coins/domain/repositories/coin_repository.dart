import '../entities/coin.dart';

abstract interface class CoinRepository {
  Future<({List<Coin> coins, String? nextCursor})> getCoins({
    String? cursor,
    String? search,
    required int limit,
  });
}
