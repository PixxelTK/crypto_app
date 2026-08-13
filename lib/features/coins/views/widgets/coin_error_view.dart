import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class CoinErrorView extends StatelessWidget {
  const CoinErrorView({
    super.key,
    this.message,
    this.onRetry,
  });

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xxxl,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.xxl),
            decoration: BoxDecoration(
              color: context.colors.danger.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: AppSizes.iconExtraLarge,
              color: context.colors.danger,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.errorTitle,
            style: AppTypography.titleLarge.copyWith(
              color: context.colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          if (message != null && message!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.massive),
              child: Text(
                message!,
                style: AppTypography.bodyMedium.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.xl),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(l10n.retryButton),
              style: FilledButton.styleFrom(
                backgroundColor: context.colors.surface,
                foregroundColor: context.colors.textPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.md,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
