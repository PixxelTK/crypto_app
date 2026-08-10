import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/features/coins/view/pages/coin_list_page.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/features/coins/domain/repositories/coin_repository.dart';
import 'package:crypto_app/features/coins/view/cubit/coin_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CoinListCubit(context.read<CoinRepository>())..loadCoins(),
            child: const CoinListPage(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const _UnknownRoutePage(),
          settings: settings,
        );
    }
  }
}

class _UnknownRoutePage extends StatelessWidget {
  const _UnknownRoutePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context)!.pageNotFound)),
    );
  }
}
