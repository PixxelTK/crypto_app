import 'package:crypto_app/features/coins/data/models/coin_model.dart';
import 'package:crypto_app/features/coins/domain/entities/coin_details.dart';

class CoinDetailsModel extends CoinModel {
  const CoinDetailsModel({
    required super.uuid,
    required super.name,
    required super.symbol,
    required super.price,
    required super.iconUrl,
    super.color,
    super.change,
    super.sparkline,
    required this.marketCap,
    required this.links,
    required this.description,
  });

  final String description;
  final List<WebsiteLink> links;
  final double marketCap;

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

  @override
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
