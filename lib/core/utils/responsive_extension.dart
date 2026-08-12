import 'package:crypto_app/style/tokens/breakpoints.dart';
import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth < AppBreakpoints.tablet;

  bool get isTablet =>
      screenWidth >= AppBreakpoints.tablet &&
      screenWidth < AppBreakpoints.desktop;

  bool get isDesktop => screenWidth >= AppBreakpoints.desktop;

  bool get isTabletOrLarger => screenWidth >= AppBreakpoints.tablet;
}
