import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/radius.dart';
import 'package:flutter/material.dart';

class CoinCardContainer extends StatelessWidget {
  const CoinCardContainer({
    super.key,
    required this.coinColor,
    required this.child,
    this.margin,
    this.padding,
    this.gradientAlphas = const [0.15, 0.05, 0.0],
    this.gradientStops = const [0.0, 0.50, 1.0],
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
  });

  final Color? coinColor;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<double> gradientAlphas;
  final List<double> gradientStops;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        color: context.colors.surface,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
          gradient: coinColor == null
              ? null
              : LinearGradient(
                  begin: gradientBegin,
                  end: gradientEnd,
                  stops: gradientStops,
                  colors: [
                    coinColor!.withValues(alpha: gradientAlphas[0]),
                    coinColor!.withValues(alpha: gradientAlphas[1]),
                    coinColor!.withValues(alpha: gradientAlphas[2]),
                    if (gradientAlphas.length > 3)
                      coinColor!.withValues(alpha: gradientAlphas[3]),
                  ].take(gradientStops.length).toList(),
                ),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
