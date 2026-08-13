import 'package:crypto_app/features/coins/domain/entities/coin_details.dart';

class WebsiteLinkModel extends WebsiteLink {
  const WebsiteLinkModel({
    required super.name,
    required super.url,
    required super.type,
  });

  factory WebsiteLinkModel.fromJson(Map<String, dynamic> json) {
    return WebsiteLinkModel(
      name: json['name'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }

  WebsiteLink toEntity() {
    return WebsiteLink(
      name: name,
      url: url,
      type: type,
    );
  }
}
