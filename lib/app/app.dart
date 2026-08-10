import 'package:crypto_app/app/app_router.dart';
import 'package:crypto_app/style/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/core/config/api_config.dart';
import 'package:crypto_app/core/network/api_client.dart';
import 'package:crypto_app/features/coins/data/repositories/coin_repository_impl.dart';
import 'package:crypto_app/features/coins/data/sources/coin_data_source.dart';
import 'package:crypto_app/features/coins/domain/repositories/coin_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CoinRepository>(
      create: (context) => CoinRepositoryImpl(
        CoinDataSource(
          ApiClient(
            baseUrl: ApiConfig.baseUrl,
            apiKey: ApiConfig.apiKey,
          ),
        ),
      ),

      child: MaterialApp(
        title: 'Crypto App',
        theme: AppTheme.light(),
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
