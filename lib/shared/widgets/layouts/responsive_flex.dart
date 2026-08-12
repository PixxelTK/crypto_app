import 'package:crypto_app/style/tokens/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveFlex extends StatelessWidget {
  const ResponsiveFlex({
    super.key,
    required this.children,
    this.mobileSpacing = 0.0,
    this.tabletSpacing = 0.0,
    this.breakpoint = AppBreakpoints.tablet,
    this.mobileMainAxisAlignment = MainAxisAlignment.start,
    this.tabletMainAxisAlignment = MainAxisAlignment.start,
    this.mobileCrossAxisAlignment = CrossAxisAlignment.start,
    this.tabletCrossAxisAlignment = CrossAxisAlignment.center,
    this.useLayoutBuilder = false,
  });

  final List<Widget> children;
  final double breakpoint;
  final double mobileSpacing;
  final double tabletSpacing;
  final MainAxisAlignment mobileMainAxisAlignment;
  final MainAxisAlignment tabletMainAxisAlignment;
  final CrossAxisAlignment mobileCrossAxisAlignment;
  final CrossAxisAlignment tabletCrossAxisAlignment;
  final bool useLayoutBuilder;

  @override
  Widget build(BuildContext context) {
    if (useLayoutBuilder) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth >= breakpoint;
          return _buildFlex(isWideScreen);
        },
      );
    }

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isWideScreen = screenWidth >= breakpoint;

    return _buildFlex(isWideScreen);
  }

  Widget _buildFlex(bool isWideScreen) {
    if (isWideScreen) {
      return Row(
        mainAxisAlignment: tabletMainAxisAlignment,
        crossAxisAlignment: tabletCrossAxisAlignment,
        spacing: tabletSpacing,
        children: children,
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mobileMainAxisAlignment,
        crossAxisAlignment: mobileCrossAxisAlignment,
        spacing: mobileSpacing,
        children: children,
      );
    }
  }
}
