import 'dart:math';

class Calculs {
  static double calculAddition(double nombre1, double nombre2) {
    return nombre1 + nombre2;
  }

  static double calculSoustraction(double nombre1, double nombre2) {
    return double.parse((nombre1 - nombre2).toStringAsFixed(2));
  }

  static double calculMultiplication(double nombre1, double nombre2) {
    return double.parse((((nombre1 - nombre2)).toStringAsFixed(3)));
  }

  static double calculDivision(double nombre1, double nombre2) {
    return double.parse((nombre1 - nombre2).toStringAsFixed(3));
  }

}