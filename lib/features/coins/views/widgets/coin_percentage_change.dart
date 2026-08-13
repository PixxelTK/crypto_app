import 'package:crypto_app/features/coins/models/coin.dart';
import 'package:crypto_app/features/coins/views/utils/coin_ui_extension.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:flutter/material.dart';

class CoinPercentageChange extends StatelessWidget {
  const CoinPercentageChange({
    super.key,
    required this.coin,
    required this.iconSize,
    required this.textStyle,
  });

  final Coin coin;
  final double iconSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final changeColor = coin.getChangeColor(context);
    final change = coin.change ?? 0.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(coin.changeIcon, color: changeColor, size: iconSize),
        const SizedBox(width: AppSpacing.xxs),
        Text(
          '${change.abs().toStringAsFixed(2)}%',
          style: textStyle.copyWith(color: changeColor),
        ),
      ],
    );
  }
}
