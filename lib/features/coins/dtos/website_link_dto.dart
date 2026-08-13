import 'package:crypto_app/features/coins/models/coin_details.dart';

class WebsiteLinkDto {
  const WebsiteLinkDto({
    required this.name,
    required this.url,
    required this.type,
  });

  final String name;
  final String url;
  final String type;

  factory WebsiteLinkDto.fromJson(Map<String, dynamic> json) {
    return WebsiteLinkDto(
      name: json['name'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }

  WebsiteLink toEntity() {
    return WebsiteLink(name: name, url: url, type: type);
  }
}
