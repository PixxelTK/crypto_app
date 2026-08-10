import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/features/coins/view/cubit/coin_list_cubit.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_search_bar.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/coin_list.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({super.key});

  @override
  State<CoinListPage> createState() => _CoinListPageState();
}

class _CoinListPageState extends State<CoinListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<CoinListCubit>().loadCoins();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final topPadding = MediaQuery.paddingOf(context).top;

    return Scaffold(
      body: RefreshIndicator.adaptive(
        edgeOffset: topPadding,
        color: context.colors.textPrimary,
        backgroundColor: context.colors.surface,
        notificationPredicate: (notification) {
          final isSearching = context.read<CoinListCubit>().isSearching;
          return !isSearching &&
              defaultScrollNotificationPredicate(notification);
        },
        onRefresh: () async {
          await context.read<CoinListCubit>().loadCoins(isRefresh: true);
        },
        child: CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 0,
              expandedHeight: 120,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.colors.background,
                      context.colors.background.withValues(alpha: 0.0),
                    ],
                    stops: const [0.3, 1],
                  ),
                ),
                child: FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.lg,
                      right: AppSpacing.lg,
                      bottom: 70,
                    ),
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: l10n.appNameFirst,
                            style: AppTypography.headingLarge.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' ${l10n.appNameSecond}',
                            style: AppTypography.headingLarge.copyWith(
                              color: context.colors.textPrimary,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: CoinSearchBar(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.lg,
                  right: AppSpacing.lg,
                  top: AppSpacing.lg,
                  bottom: AppSpacing.sm,
                ),
                child: BlocBuilder<CoinListCubit, CoinListState>(
                  builder: (context, state) {
                    final isSearching = context
                        .read<CoinListCubit>()
                        .isSearching;
                    return Text(
                      isSearching
                          ? l10n.searchResultsTitle
                          : l10n.topCoinsTitle,
                      style: AppTypography.headingSmall.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: CoinList()),
          ],
        ),
      ),
    );
  }
}
