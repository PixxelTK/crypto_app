String formatMarketCap(double value) {
  if (value >= 1e12) {
    return '${(value / 1e12).toStringAsFixed(2)} Trillion';
  } else if (value >= 1e9) {
    return '${(value / 1e9).toStringAsFixed(2)} Billion';
  } else if (value >= 1e6) {
    return '${(value / 1e6).toStringAsFixed(2)} Million';
  } else {
    return value.toStringAsFixed(2);
  }
}
