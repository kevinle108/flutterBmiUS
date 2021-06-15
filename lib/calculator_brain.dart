import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int feet;
  final int inches;
  double _bmi;

  CalculatorBrain({ this.weight, this.feet, this.inches,});

  String calculateBMI() {
    print('calculateBMI');
    int heightInInches = feet * 12 + inches;
    _bmi = (weight / pow(heightInInches, 2)) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();
    if (_bmi >= 25) return 'Overweight';
    else if (_bmi > 18.5) return 'Normal';
    else return 'Underweight';
  }

  String getInterpretation() {
    print('getInterpretation');
    if (_bmi >= 25) return 'You have a higher than normal body weight. Try to exercise more.';
    else if (_bmi > 18.5) return 'You have a normal body weight. Good job!';
    else return 'You have a lower than normal body weight. You can eat a bit more.';
  }

}