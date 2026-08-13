import 'package:crypto_app/features/coins/models/coin_details.dart';
import 'package:crypto_app/features/coins/repositories/coin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CoinDetailsState {}

class CoinDetailsLoadingState extends CoinDetailsState {}

class CoinDetailsLoadedState extends CoinDetailsState {
  CoinDetailsLoadedState(this.details);
  final CoinDetails details;
}

class CoinDetailsErrorState extends CoinDetailsState {
  CoinDetailsErrorState(this.message);
  final String message;
}

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  CoinDetailsCubit(this.repository) : super(CoinDetailsLoadingState()) {
    loadCoinDetails();
  }

  final CoinRepository repository;
  String? _uuid;

  void setUuid(String uuid) {
    _uuid = uuid;
    loadCoinDetails();
  }

  Future<void> loadCoinDetails() async {
    if (_uuid == null) return;

    emit(CoinDetailsLoadingState());
    try {
      final details = await repository.getCoinDetails(_uuid!);
      emit(CoinDetailsLoadedState(details));
    } catch (e) {
      emit(CoinDetailsErrorState(e.toString()));
    }
  }
}
