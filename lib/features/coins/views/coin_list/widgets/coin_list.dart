import 'package:crypto_app/features/coins/models/coin.dart';
import 'package:crypto_app/features/coins/views/coin_list/coin_list_cubit.dart';
import 'package:crypto_app/features/coins/views/widgets/coin_empty_view.dart';
import 'package:crypto_app/features/coins/views/widgets/coin_error_view.dart';
import 'package:crypto_app/features/coins/views/coin_list/widgets/coin_list_loading.dart';
import 'package:crypto_app/features/coins/views/coin_list/widgets/coin_list_item.dart';
import 'package:crypto_app/features/coins/views/coin_list/widgets/invite_friends_item.dart';
import 'package:crypto_app/shared/widgets/layouts/max_width_container.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/utils/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return BlocBuilder<CoinListCubit, CoinListState>(
      builder: (context, state) {
        if (state is CoinListLoadingState) {
          return const SliverToBoxAdapter(
            child: MaxWidthContainer(child: CoinListLoading()),
          );
        }
        if (state is CoinListErrorState) {
          return SliverToBoxAdapter(
            child: MaxWidthContainer(
              child: CoinErrorView(
                onRetry: () =>
                    context.read<CoinListCubit>().loadCoins(isRefresh: true),
              ),
            ),
          );
        }

        if (state is CoinListLoadedState) {
          if (state.coins.isEmpty) {
            return SliverToBoxAdapter(
              child: MaxWidthContainer(
                child: CoinEmptyView(
                  onRetry: () =>
                      context.read<CoinListCubit>().loadCoins(isRefresh: true),
                ),
              ),
            );
          }

          final isSearching = context.read<CoinListCubit>().isSearching;
          final displayCoins = isSearching
              ? state.coins
              : state.coins.skip(3).toList();

          final items = <_CoinListItemType>[];
          for (int i = 0; i < displayCoins.length; i++) {
            items.add(_CoinData(displayCoins[i]));

            final coinCount = i + 1;
            if (coinCount >= 5 && coinCount % 5 == 0) {
              final quotient = coinCount ~/ 5;
              if ((quotient & (quotient - 1)) == 0) {
                items.add(const _InviteBanner());
              }
            }
          }

          final hasNextLoading = state.isFetchingNext;
          final totalCount = items.length + (hasNextLoading ? 1 : 0);

          return SliverPadding(
            padding: EdgeInsets.only(
              bottom: context.isWeb ? AppSpacing.lg : bottomPadding,
            ),
            sliver: SliverList.builder(
              itemCount: totalCount,
              itemBuilder: (context, index) {
                if (hasNextLoading && index == totalCount - 1) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                }

                final Widget widget = switch (items[index]) {
                  _CoinData(:final coin) => CoinListItem(coin: coin),
                  _InviteBanner() => const InviteFriendsItem(),
                };

                return MaxWidthContainer(child: widget);
              },
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

sealed class _CoinListItemType {
  const _CoinListItemType();
}

class _CoinData extends _CoinListItemType {
  const _CoinData(this.coin);
  final Coin coin;
}

class _InviteBanner extends _CoinListItemType {
  const _InviteBanner();
}
