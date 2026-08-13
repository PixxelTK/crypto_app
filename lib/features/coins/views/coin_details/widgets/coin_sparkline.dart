import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crypto_app/features/coins/models/coin.dart';
import 'package:crypto_app/features/coins/views/utils/coin_ui_extension.dart';

class SparklineChart extends StatelessWidget {
  const SparklineChart({
    super.key,
    required this.data,
    required this.lineColor,
    this.lineWidth = 1.5,
  });

  final List<double> data;
  final Color lineColor;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();

    return CustomPaint(
      painter: _SparklinePainter(
        data: data,
        lineColor: lineColor,
        lineWidth: lineWidth,
      ),
    );
  }
}

class CoinSparkline extends StatelessWidget {
  const CoinSparkline({super.key, required this.coin, this.lineWidth = 1.5});

  final Coin coin;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    if (coin.sparkline == null || coin.sparkline!.isEmpty) {
      return const SizedBox.shrink();
    }

    return SparklineChart(
      data: coin.sparkline!,
      lineColor: coin.getChangeColor(context),
      lineWidth: lineWidth,
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({
    required this.data,
    required this.lineColor,
    required this.lineWidth,
  });

  final List<double> data;
  final Color lineColor;
  final double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final double minVal = data.reduce(min);
    final double maxVal = data.reduce(max);
    final double range = maxVal - minVal;

    final path = Path();

    for (int i = 0; i < data.length; i++) {
      final double x = (i / (data.length - 1)) * size.width;
      final double normalizedY = range == 0 ? 0.5 : (data[i] - minVal) / range;
      final double y = size.height - (normalizedY * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withValues(alpha: 0.4),
          lineColor.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.lineWidth != lineWidth;
  }
}
