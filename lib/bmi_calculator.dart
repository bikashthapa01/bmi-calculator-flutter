import 'dart:math';

class BmiCalculator {
  late final int height;
  late final int weight;

  late double _bmi;

  BmiCalculator({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / (pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 1.5) {
      return "Normal";
    } else {
      return 'UnderWeight';
    }
  }

  String getMessage() {
    if (_bmi >= 25) {
      return 'Dude, you Need to eat less and Exercise More !';
    } else if (_bmi > 1.5) {
      return "Wow, You are doing good job to maintain your Shape. Keep it Up.";
    } else {
      return 'OMG! You Need to Eat more and Think less.';
    }
  }
}
