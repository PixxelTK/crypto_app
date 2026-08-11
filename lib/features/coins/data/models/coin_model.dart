import 'package:crypto_app/features/coins/domain/entities/coin.dart';

class CoinModel {
  const CoinModel({
    required this.uuid,
    required this.name,
    required this.symbol,
    required this.price,
    required this.iconUrl,
    this.color,
    this.change,
    this.sparkline,
  });

  final String uuid;
  final String name;
  final String symbol;
  final double price;
  final String iconUrl;
  final String? color;
  final double? change;
  final List<double>? sparkline;

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      price: double.parse(json['price'] as String),
      iconUrl: json['iconUrl'] as String,
      color: json['color'] as String?,
      change: json['change'] != null
          ? double.tryParse(json['change'] as String)
          : null,
      sparkline: json['sparkline'] != null
          ? (json['sparkline'] as List<dynamic>)
                .map((e) => e != null ? double.tryParse(e.toString()) : null)
                .whereType<double>()
                .toList()
          : null,
    );
  }

  Coin toEntity() {
    return Coin(
      uuid: uuid,
      name: name,
      symbol: symbol,
      price: price,
      iconUrl: iconUrl,
      color: color,
      change: change,
      sparkline: sparkline,
    );
  }
}
