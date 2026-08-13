import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

class CoinDetailSectionItem extends StatelessWidget {
  const CoinDetailSectionItem({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xs,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.labelLarge.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        child,
      ],
    );
  }
}
