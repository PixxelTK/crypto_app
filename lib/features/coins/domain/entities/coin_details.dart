class CoinDetails {
  const CoinDetails({
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
