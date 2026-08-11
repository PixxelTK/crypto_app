import 'package:crypto_app/features/coins/domain/entities/coin.dart';
import 'package:crypto_app/features/coins/view/utils/coin_ui_extension.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_avatar.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_card_container.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_percentage_change.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_sparkline.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class TopCoinsSection extends StatelessWidget {
  const TopCoinsSection({super.key, required this.coins});

  final List<Coin> coins;

  @override
  Widget build(BuildContext context) {
    if (coins.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        children: [
          _Top1CoinCard(coin: coins.first),
          if (coins.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(child: _TopCoinCompactCard(coin: coins[1])),
                  const SizedBox(width: AppSpacing.md),
                  if (coins.length > 2)
                    Expanded(child: _TopCoinCompactCard(coin: coins[2]))
                  else
                    const Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Top1CoinCard extends StatelessWidget {
  const _Top1CoinCard({required this.coin});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final coinColor = coin.parsedColor;

    return CoinCardContainer(
      coinColor: coinColor,
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      gradientAlphas: const [0.2, 0.1, 0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppSpacing.md,
            children: [
              CoinAvatar(
                iconUrl: coin.iconUrl,
                coinColor: coinColor,
                radius: AppSizes.iconLarge,
                imageSize: AppSizes.iconExtraLarge,
                fallbackIconSize: AppSizes.iconLarge,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: AppTypography.titleLarge.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.bold,
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
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${coin.price.toStringAsFixed(2)}',
                      style: AppTypography.headingMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    CoinPercentageChange(
                      coin: coin,
                      iconSize: AppSizes.iconMedium,
                      textStyle: AppTypography.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 164,
                height: 48,
                child: CoinSparkline(coin: coin, lineWidth: 2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopCoinCompactCard extends StatelessWidget {
  const _TopCoinCompactCard({required this.coin});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return CoinCardContainer(
      coinColor: coin.parsedColor,
      padding: const EdgeInsets.all(AppSpacing.md),
      gradientAlphas: const [0.2, 0.08, 0.0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CoinAvatar(
                iconUrl: coin.iconUrl,
                coinColor: coin.parsedColor,
                radius: AppSizes.iconMedium,
                imageSize: AppSizes.iconLarge,
                fallbackIconSize: AppSizes.iconMedium,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  coin.symbol,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.name,
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      '\$${coin.price.toStringAsFixed(2)}',
                      style: AppTypography.titleMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    CoinPercentageChange(
                      coin: coin,
                      iconSize: AppSizes.iconSmall,
                      textStyle: AppTypography.labelMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 64, height: 24, child: CoinSparkline(coin: coin)),
            ],
          ),
        ],
      ),
    );
  }
}
