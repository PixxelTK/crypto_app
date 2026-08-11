import 'package:crypto_app/shared/widgets/pulse_loading.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/radius.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:flutter/material.dart';

class CoinDetailLoading extends StatelessWidget {
  const CoinDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerHeight = 60 + MediaQuery.paddingOf(context).top;

    return PulseLoading(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: bannerHeight,
                  width: double.infinity,
                  color: context.colors.border,
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
                          child: Container(
                            width: AppSizes.iconExtraLarge * 2.4,
                            height: AppSizes.iconExtraLarge * 2.4,
                            decoration: BoxDecoration(
                              color: context.colors.border,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSpacing.md,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: context.colors.border,
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.xs,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Container(
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: context.colors.border,
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.xs,
                                    ),
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
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: context.colors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _SectionLoading(width1: 120, width2: 180),
                  const _SectionLoading(width1: 100, width2: 150),
                  const _SectionLoading(
                    width1: 120,
                    width2: double.infinity,
                    lines: 4,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: context.colors.border,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLoading extends StatelessWidget {
  const _SectionLoading({
    required this.width1,
    required this.width2,
    this.lines = 1,
  });

  final double width1;
  final double width2;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width1,
            height: 16,
            decoration: BoxDecoration(
              color: context.colors.border,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...List.generate(lines, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Container(
                width: index == lines - 1 && lines > 1 ? width2 * 0.7 : width2,
                height: 24,
                decoration: BoxDecoration(
                  color: context.colors.border,
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
