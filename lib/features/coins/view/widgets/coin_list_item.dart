import 'package:crypto_app/features/coins/domain/entities/coin.dart';
import 'package:crypto_app/features/coins/view/utils/coin_ui_extension.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_avatar.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_card_container.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_percentage_change.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class CoinListItem extends StatelessWidget {
  const CoinListItem({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return CoinCardContainer(
      coinColor: coin.parsedColor,
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
        right: AppSpacing.lg,
        left: AppSpacing.lg,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      gradientAlphas: const [0.15, 0.08, 0.05, 0.0],
      gradientStops: const [0.0, 0.30, 0.50, 1.0],
      gradientBegin: Alignment.centerLeft,
      gradientEnd: Alignment.centerRight,
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          CoinAvatar(
            iconUrl: coin.iconUrl,
            coinColor: coin.parsedColor,
            radius: AppSizes.iconLarge,
            imageSize: AppSizes.iconExtraLarge,
            fallbackIconSize: AppSizes.iconLarge,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  coin.symbol,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${coin.price.toStringAsFixed(2)}',
                style: AppTypography.titleMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              CoinPercentageChange(
                coin: coin,
                iconSize: AppSizes.iconSmall,
                textStyle: AppTypography.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
