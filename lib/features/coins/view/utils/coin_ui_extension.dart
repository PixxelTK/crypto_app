import 'package:crypto_app/features/coins/domain/entities/coin.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:flutter/material.dart';

extension CoinUIExtension on Coin {
  Color? get parsedColor {
    if (color != null && color!.startsWith('#')) {
      return Color(int.parse(color!.replaceFirst('#', '0xff')));
    }
    return null;
  }

  bool get isPositiveChange {
    return (change ?? 0.0) >= 0;
  }

  Color getChangeColor(BuildContext context) {
    return isPositiveChange ? context.colors.success : context.colors.danger;
  }

  IconData get changeIcon {
    return isPositiveChange
        ? Icons.arrow_upward_rounded
        : Icons.arrow_downward_rounded;
  }
}
