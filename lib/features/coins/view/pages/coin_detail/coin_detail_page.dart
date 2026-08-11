import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/features/coins/view/cubit/coin_details_cubit.dart';
import 'package:crypto_app/features/coins/view/utils/coin_ui_extension.dart';
import 'package:crypto_app/features/coins/view/pages/coin_detail/widgets/coin_detail_header.dart';
import 'package:crypto_app/features/coins/view/pages/coin_detail/widgets/coin_detail_loading.dart';
import 'package:crypto_app/features/coins/view/pages/coin_detail/widgets/coin_detail_section_item.dart';
import 'package:crypto_app/features/coins/view/pages/coin_detail/widgets/coin_detail_website_button.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_error_view.dart';
import 'package:crypto_app/features/coins/view/pages/coin_detail/widgets/coin_sparkline.dart';
import 'package:crypto_app/core/utils/market_cap_formatter.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';

class CoinDetailPage extends StatelessWidget {
  const CoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: context.colors.textPrimary,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
        builder: (context, state) {
          if (state is CoinDetailsLoadingState) {
            return const CoinDetailLoading();
          }

          if (state is CoinDetailsErrorState) {
            return Center(
              child: CoinErrorView(
                onRetry: () =>
                    context.read<CoinDetailsCubit>().loadCoinDetails(),
              ),
            );
          }

          if (state is CoinDetailsLoadedState) {
            final details = state.details;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoinDetailHeader(details: details),
                  const SizedBox(height: 80),
                  if (details.sparkline != null &&
                      details.sparkline!.isNotEmpty) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: SparklineChart(
                        data: details.sparkline!,
                        lineColor: details.getChangeColor(context),
                        lineWidth: 2,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CoinDetailSectionItem(
                          title: l10n.detailPrice,
                          child: Text(
                            '\$${details.price.toStringAsFixed(2)}',
                            style: AppTypography.headingLarge.copyWith(
                              color: context.colors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CoinDetailSectionItem(
                          title: l10n.detailMarketCap,
                          child: Text(
                            '\$${formatMarketCap(details.marketCap)}',
                            style: AppTypography.titleLarge.copyWith(
                              color: context.colors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CoinDetailSectionItem(
                          title: l10n.detailDescription,
                          child: Text(
                            details.description.isNotEmpty
                                ? details.description
                                : l10n.detailNoDescription,
                            style: AppTypography.bodyMedium.copyWith(
                              color: context.colors.textPrimary,
                              height: 1.5,
                            ),
                          ),
                        ),
                        if (details.websiteUrl != null)
                          CoinDetailWebsiteButton(
                            websiteUrl: details.websiteUrl!,
                          ),
                        const SizedBox(height: AppSpacing.xxl),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
