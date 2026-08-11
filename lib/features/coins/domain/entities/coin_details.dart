import 'package:crypto_app/features/coins/domain/entities/coin.dart';

class CoinDetails extends Coin {
  const CoinDetails({
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

  String? get websiteUrl {
    try {
      return links.firstWhere((link) => link.type == 'website').url;
    } catch (_) {
      return null;
    }
  }
}

class WebsiteLink {
  const WebsiteLink({
    required this.name,
    required this.url,
    required this.type,
  });

  final String name;
  final String url;
  final String type;

  factory WebsiteLink.fromJson(Map<String, dynamic> json) {
    return WebsiteLink(
      name: json['name'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }
}
