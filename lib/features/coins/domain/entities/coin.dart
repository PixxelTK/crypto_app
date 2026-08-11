class Coin {
  const Coin({
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
}
