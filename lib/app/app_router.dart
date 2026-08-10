import 'package:crypto_app/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
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
    return const Scaffold(body: Center(child: Text('Page not found')));
  }
}
