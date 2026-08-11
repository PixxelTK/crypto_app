import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_card_container.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsItem extends StatelessWidget {
  const InviteFriendsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CoinCardContainer(
      onTap: () {
        SharePlus.instance.share(
          ShareParams(uri: Uri.parse('https://www.7solutions.co.th/jobs')),
        );
      },
      coinColor: context.colors.surface,
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
        right: AppSpacing.lg,
        left: AppSpacing.lg,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      gradientAlphas: const [0.2, 0.05, 0.0],
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.group_add_rounded,
              color: context.colors.success,
              size: 28,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.inviteFriendsTitle,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.inviteFriendsSubtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.ios_share_rounded,
            color: context.colors.success,
            size: 24,
          ),
        ],
      ),
    );
  }
}
