import '../flutter_miniplayer.dart';

extension SelectedColorExtension on PanelState {
  int get heightCode {
    switch (this) {
      case PanelState.MIN:
        return -1;
      case PanelState.MAX:
        return -2;
      case PanelState.DISMISS:
        return -3;
      default:
        return -1;
    }
  }
}

///Calculates the percentage of a value within a given range of values
double percentageFromValueInRange(
    {required double min, required double max, required double value}) {
  return (value - min) / (max - min);
}

double borderDouble(
    {required double minRange,
    required double maxRange,
    required double value}) {
  return value > maxRange
      ? maxRange
      : value < minRange
          ? minRange
          : value;
}
