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
    final bannerHeight = 100 + MediaQuery.paddingOf(context).top;

    return PulseLoading(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
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
                            context.colors.surface.withValues(alpha: 1),
                            context.colors.surface.withValues(alpha: 0.8),
                            context.colors.surface.withValues(alpha: 0.5),
                            context.colors.surface.withValues(alpha: 0),
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
                            child: Container(
                              width: AppSizes.iconExtraLarge * 2,
                              height: AppSizes.iconExtraLarge * 2,
                              decoration: BoxDecoration(
                                color: context.colors.border,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Expanded(
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
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  Container(
                    width: double.infinity,
                    height: AppSizes.buttonLargeHeight,
                    decoration: BoxDecoration(
                      color: context.colors.border,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ],
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
