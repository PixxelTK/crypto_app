import 'dart:ui';
import 'package:crypto_app/app/localization/app_localizations.dart';
import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/radius.dart';
import 'package:crypto_app/style/tokens/sizes.dart';
import 'package:crypto_app/style/tokens/spacing.dart';
import 'package:crypto_app/style/tokens/typography.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/core/utils/debouncer.dart';
import 'package:crypto_app/features/coins/views/coin_list/coin_list_cubit.dart';

class CoinSearchBar extends StatefulWidget {
  const CoinSearchBar({super.key});

  @override
  State<CoinSearchBar> createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends State<CoinSearchBar> {
  final _controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1000);
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isNotEmpty = _controller.text.isNotEmpty;
      if (_showClear != isNotEmpty) {
        setState(() => _showClear = isNotEmpty);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      if (mounted) {
        context.read<CoinListCubit>().searchCoins(query);
      }
    });
  }

  void _onClear() {
    _controller.clear();
    context.read<CoinListCubit>().searchCoins('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: AppColors.neutral900.withValues(alpha: 0.1),
              blurRadius: AppRadius.lg,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: Container(
              height: AppSizes.inputHeight,
              decoration: BoxDecoration(
                color: context.colors.surface.withValues(alpha: 0.8),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _controller,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searchCoinsHint,
                  hintStyle: AppTypography.bodyMedium.copyWith(
                    color: context.colors.textTertiary,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: context.colors.textSecondary,
                    size: AppSizes.iconMedium,
                  ),
                  suffixIcon: _showClear
                      ? IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            color: context.colors.textSecondary,
                            size: AppSizes.iconMedium,
                          ),
                          onPressed: _onClear,
                        )
                      : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
