import 'package:crypto_app/features/coins/view/cubit/coin_list_cubit.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_empty_view.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_error_view.dart';
import 'package:crypto_app/features/coins/view/pages/coin_list/widgets/coin_list_loading.dart';
import 'package:crypto_app/features/coins/view/pages/coin_list/widgets/coin_list_item.dart';
import 'package:crypto_app/features/coins/view/pages/coin_list/widgets/invite_friends_item.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
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
          return const CoinListLoading();
        }
        if (state is CoinListErrorState) {
          return CoinErrorView(
            onRetry: () =>
                context.read<CoinListCubit>().loadCoins(isRefresh: true),
          );
        }

        if (state is CoinListLoadedState) {
          if (state.coins.isEmpty) {
            return CoinEmptyView(
              onRetry: () =>
                  context.read<CoinListCubit>().loadCoins(isRefresh: true),
            );
          }

          final isSearching = context.read<CoinListCubit>().isSearching;
          final displayCoins = isSearching
              ? state.coins
              : state.coins.skip(3).toList();

          final listItems = <Widget>[];
          for (int i = 0; i < displayCoins.length; i++) {
            listItems.add(CoinListItem(coin: displayCoins[i]));
            
            final coinCount = i + 1;
            if (coinCount >= 5 && coinCount % 5 == 0) {
              final quotient = coinCount ~/ 5;
              if ((quotient & (quotient - 1)) == 0) {
                listItems.add(const InviteFriendsItem());
              }
            }
          }

          return Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(bottom: bottomPadding),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return listItems[index];
                },
              ),
              if (state.isFetchingNext)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
