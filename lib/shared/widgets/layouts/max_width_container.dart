import 'package:crypto_app/style/utils/responsive_extension.dart';
import 'package:crypto_app/style/tokens/breakpoints.dart';
import 'package:flutter/material.dart';

class MaxWidthContainer extends StatelessWidget {
  const MaxWidthContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.alignment = Alignment.topCenter,
    this.padding,
    this.ignoreSafeAreas = false,
  });

  final Widget child;
  final double? maxWidth;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;
  final bool ignoreSafeAreas;

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    Widget alignedContent = Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              maxWidth ??
              (context.screenWidth <= AppBreakpoints.desktop
                  ? AppBreakpoints.tablet
                  : AppBreakpoints.maxWidth),
        ),
        child: SizedBox(width: double.infinity, child: content),
      ),
    );

    if (context.isOrientationLandscape && !ignoreSafeAreas) {
      return SafeArea(
        left: true,
        right: true,
        top: false,
        bottom: false,
        child: alignedContent,
      );
    }

    return alignedContent;
  }
}
