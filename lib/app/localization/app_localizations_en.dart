// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Crypto App';

  @override
  String get coinsPageTitle => 'Coins';

  @override
  String get searchCoinsHint => 'Search coins...';

  @override
  String get topCoinsTitle => 'Top Coins';

  @override
  String priceLabel(String price) {
    return 'Price: $price';
  }

  @override
  String changeLabel(String change) {
    return 'Change: $change%';
  }

  @override
  String get pageNotFound => 'Page not found';
}
