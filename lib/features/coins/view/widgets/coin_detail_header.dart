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
    final bannerHeight = 60 + MediaQuery.paddingOf(context).top;

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
              colors: [coinColor.withValues(alpha: 0.7), coinColor],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: -22,
          left: AppSpacing.xl,
          right: AppSpacing.xl,
          child: FractionalTranslation(
            translation: const Offset(0, 0.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    radius: AppSizes.iconExtraLarge * 1.2,
                    imageSize: AppSizes.iconExtraLarge * 2.4,
                    fallbackIconSize: AppSizes.iconExtraLarge,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
