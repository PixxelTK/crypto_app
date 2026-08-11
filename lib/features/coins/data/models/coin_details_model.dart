import 'package:crypto_app/features/coins/domain/entities/coin_details.dart';

class CoinDetailsModel {
  const CoinDetailsModel({
    required this.uuid,
    required this.name,
    required this.description,
    required this.symbol,
    required this.links,
    required this.price,
    required this.marketCap,
    required this.iconUrl,
    this.color,
    this.change,
    this.sparkline,
  });

  final String uuid;
  final String name;
  final String description;
  final String symbol;
  final List<WebsiteLink> links;
  final double price;
  final double marketCap;
  final String iconUrl;
  final String? color;
  final double? change;
  final List<double>? sparkline;

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) {
    return CoinDetailsModel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      symbol: json['symbol'] as String,
      links: (json['links'] as List<dynamic>)
          .map((json) => WebsiteLink.fromJson(json as Map<String, dynamic>))
          .toList(),
      price: double.parse(json['price'] as String),
      marketCap: double.parse(json['marketCap'] as String),
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

  CoinDetails toEntity() {
    return CoinDetails(
      uuid: uuid,
      name: name,
      description: description,
      symbol: symbol,
      links: links,
      price: price,
      marketCap: marketCap,
      iconUrl: iconUrl,
      color: color,
      change: change,
      sparkline: sparkline,
    );
  }
}
