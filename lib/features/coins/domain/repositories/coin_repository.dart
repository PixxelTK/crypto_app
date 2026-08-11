import 'package:crypto_app/features/coins/domain/entities/coin_details.dart';

import '../entities/coin.dart';

abstract interface class CoinRepository {
  Future<({List<Coin> coins, String? nextCursor})> getCoins({
    String? cursor,
    String? search,
    required int limit,
  });

  Future<CoinDetails> getCoinDetails(String uuid);
}
