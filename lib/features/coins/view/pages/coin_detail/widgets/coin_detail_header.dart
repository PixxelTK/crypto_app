import 'package:crypto_app/features/coins/domain/entities/coin_details.dart';
import 'package:crypto_app/features/coins/view/utils/coin_ui_extension.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_avatar.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class CoinDetailHeader extends StatelessWidget {
  const CoinDetailHeader({super.key, required this.details});

  final CoinDetails details;

  @override
  Widget build(BuildContext context) {
    final coinColor = details.parsedColor ?? context.colors.primary;
    final bannerHeight = 100 + MediaQuery.paddingOf(context).top;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: bannerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                coinColor.withValues(alpha: 0.7),
                coinColor.withValues(alpha: 0.3),
                coinColor.withValues(alpha: 0.1),
                coinColor.withValues(alpha: 0),
              ],
              stops: const [0.0, 0.4, 0.7, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: AppSpacing.md,
          left: AppSpacing.md,
          right: AppSpacing.md,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppSpacing.md,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.background,
                ),
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: CoinAvatar(
                  iconUrl: details.iconUrl,
                  coinColor: details.parsedColor,
                  radius: AppSizes.iconExtraLarge,
                  imageSize: AppSizes.iconExtraLarge * 2,
                  fallbackIconSize: AppSizes.iconExtraLarge * 2,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      details.name,
                      style: AppTypography.headingMedium.copyWith(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      details.symbol,
                      style: AppTypography.titleMedium.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
