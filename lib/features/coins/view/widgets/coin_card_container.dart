import 'package:crypto_app/style/tokens/colors.dart';
import 'package:crypto_app/style/tokens/radius.dart';
import 'package:flutter/material.dart';

class CoinCardContainer extends StatefulWidget {
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
    this.onTap,
  });

  final Color? coinColor;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<double> gradientAlphas;
  final List<double> gradientStops;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final VoidCallback? onTap;

  @override
  State<CoinCardContainer> createState() => _CoinCardContainerState();
}

class _CoinCardContainerState extends State<CoinCardContainer> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color _getSurfaceColor(BuildContext context) {
    final baseColor = context.colors.surface;
    if (_isPressed) {
      return Color.lerp(baseColor, Colors.black, 0.1) ?? baseColor;
    } else if (_isHovered) {
      return Color.lerp(baseColor, Colors.black, 0.05) ?? baseColor;
    }
    return baseColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: widget.onTap != null
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _isPressed ? 0.96 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
                color: _getSurfaceColor(context),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
                  gradient: widget.coinColor == null
                      ? null
                      : LinearGradient(
                          begin: widget.gradientBegin,
                          end: widget.gradientEnd,
                          stops: widget.gradientStops,
                          colors: [
                            widget.coinColor!.withValues(
                              alpha: widget.gradientAlphas[0],
                            ),
                            widget.coinColor!.withValues(
                              alpha: widget.gradientAlphas[1],
                            ),
                            widget.coinColor!.withValues(
                              alpha: widget.gradientAlphas[2],
                            ),
                            if (widget.gradientAlphas.length > 3)
                              widget.coinColor!.withValues(
                                alpha: widget.gradientAlphas[3],
                              ),
                          ].take(widget.gradientStops.length).toList(),
                        ),
                ),
                padding: widget.padding,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
