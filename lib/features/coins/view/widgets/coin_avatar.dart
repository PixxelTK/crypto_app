import 'package:crypto_app/style/tokens/colors.dart';
import 'package:flutter/material.dart';

class CoinAvatar extends StatelessWidget {
  const CoinAvatar({
    super.key,
    required this.iconUrl,
    required this.coinColor,
    required this.radius,
    required this.imageSize,
    required this.fallbackIconSize,
  });

  final String iconUrl;
  final Color? coinColor;
  final double radius;
  final double imageSize;
  final double fallbackIconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colors.surfaceSecondary,
      radius: radius,
      child: ClipOval(
        child: Image.network(
          iconUrl.replaceAll('.svg', '.png'),
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.monetization_on,
            color: coinColor ?? context.colors.textDisabled,
            size: fallbackIconSize,
          ),
        ),
      ),
    );
  }
}
