import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class TopCoinsSection extends StatelessWidget {
  const TopCoinsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.topCoinsTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('soon'),
        ],
      ),
    );
  }
}
