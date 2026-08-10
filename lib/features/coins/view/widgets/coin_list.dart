import 'package:crypto_app/features/coins/view/cubit/coin_list_cubit.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_empty_state.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_list_error.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_list_loading.dart';
import 'package:crypto_app/features/coins/view/widgets/coin_list_item.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinListCubit, CoinListState>(
      builder: (context, state) {
        if (state is CoinListLoadingState) {
          return const CoinListLoading();
        }
        if (state is CoinListErrorState) {
          return CoinListError(message: state.message);
        }

        if (state is CoinListLoadedState) {
          if (state.coins.isEmpty) {
            return const CoinEmptyState();
          }
          return Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.coins.length,
                itemBuilder: (context, index) {
                  return CoinListItem(coin: state.coins[index]);
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
