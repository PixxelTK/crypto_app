import 'package:crypto_app/features/coins/domain/entities/coin.dart';
import 'package:crypto_app/features/coins/view/utils/coin_ui_extension.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/radius.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class CoinListItem extends StatelessWidget {
  const CoinListItem({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final coinColor = coin.parsedColor;
    final change = coin.change ?? 0.0;
    final changeColor = coin.getChangeColor(context);
    final changeIcon = coin.changeIcon;

    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
        right: AppSpacing.lg,
        left: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        color: context.colors.surface,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
          gradient: coinColor == null
              ? null
              : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.0, 0.30, 0.50, 1.0],
                  colors: [
                    coinColor.withValues(alpha: 0.15),
                    coinColor.withValues(alpha: 0.08),
                    coinColor.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            CircleAvatar(
              backgroundColor: context.colors.surfaceSecondary,
              radius: AppSizes.iconLarge,
              child: ClipOval(
                child: Image.network(
                  coin.iconUrl.replaceAll('.svg', '.png'),
                  width: AppSizes.iconExtraLarge,
                  height: AppSizes.iconExtraLarge,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.monetization_on,
                    color: coinColor ?? context.colors.textDisabled,
                  ),
                ),
              ),
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      changeIcon,
                      color: changeColor,
                      size: AppSizes.iconSmall,
                    ),
                    const SizedBox(width: AppSpacing.xxs),
                    Text(
                      '${change.abs().toStringAsFixed(2)}%',
                      style: AppTypography.labelMedium.copyWith(
                        color: changeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
