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

  @override
  String get emptyCoinsTitle => 'No coins found';

  @override
  String get emptyCoinsSubtitle =>
      'We couldn\'t find any coins at the moment. Please try again.';

  @override
  String get retryButton => 'Retry';

  @override
  String get errorTitle => 'Oops! Something went wrong';

  @override
  String get defaultErrorMessage =>
      'An unexpected error occurred. Please try again.';

  @override
  String get appNameFirst => 'Crypto';

  @override
  String get appNameSecond => 'Coins';

  @override
  String get searchResultsTitle => 'Search Results';

  @override
  String get inviteFriendsTitle => 'Invite Friends';

  @override
  String get inviteFriendsSubtitle => 'Share this experience with your friends';

  @override
  String get detailPrice => 'Price';

  @override
  String get detailMarketCap => 'Market Cap';

  @override
  String get detailDescription => 'Description';

  @override
  String get detailNoDescription => 'No description';

  @override
  String get detailWebsiteButton => 'Go to Website';

  @override
  String get detailWebsiteLaunchError => 'Could not launch website';

  @override
  String errorPrefix(String message) {
    return 'Error: $message';
  }
}
