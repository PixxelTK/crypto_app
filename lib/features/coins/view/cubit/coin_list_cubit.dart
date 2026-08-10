import 'package:crypto_app/features/coins/domain/entities/coin.dart';
import 'package:crypto_app/features/coins/domain/repositories/coin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CoinListState {}

class CoinListLoadingState extends CoinListState {}

class CoinListLoadedState extends CoinListState {
  CoinListLoadedState(this.coins, {this.isFetchingNext = false});
  final List<Coin> coins;
  final bool isFetchingNext;
}

class CoinListErrorState extends CoinListState {
  CoinListErrorState(this.message);
  final String message;
}

class CoinListCubit extends Cubit<CoinListState> {
  CoinListCubit(this.repository) : super(CoinListLoadingState());

  final CoinRepository repository;
  String? _nextCursor;
  bool _isLoading = false;
  String _searchQuery = '';

  bool get isSearching => _searchQuery.isNotEmpty;

  void searchCoins(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _isLoading = false;
    loadCoins(isRefresh: true);
  }

  Future<void> loadCoins({bool isRefresh = false}) async {
    if (_isLoading) return;

    if (!isRefresh && state is CoinListLoadedState && _nextCursor == null) {
      return;
    }

    _isLoading = true;

    try {
      if (isRefresh) {
        _nextCursor = null;
        emit(CoinListLoadingState());
      } else if (state is CoinListLoadedState) {
        emit(
          CoinListLoadedState(
            (state as CoinListLoadedState).coins,
            isFetchingNext: true,
          ),
        );
      }

      final result = await repository.getCoins(
        cursor: _nextCursor,
        search: _searchQuery.isEmpty ? null : _searchQuery,
        limit: 10,
      );
      _nextCursor = result.nextCursor;

      if (isRefresh || state is! CoinListLoadedState) {
        emit(CoinListLoadedState(result.coins));
      } else {
        final currentCoins = (state as CoinListLoadedState).coins;
        emit(CoinListLoadedState([...currentCoins, ...result.coins]));
      }
    } catch (e) {
      if (state is! CoinListLoadedState) {
        emit(CoinListErrorState(e.toString()));
      }
    } finally {
      _isLoading = false;
    }
  }
}
