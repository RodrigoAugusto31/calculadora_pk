library calculadora_pk;

import 'package:flutter/services.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

void openCalculator() {
    // Chama o método para abrir a calculadora nativa do dispositivo
    const platform = MethodChannel('calculadora_pk/openCalculator');
    platform.invokeMethod('open');
  }
}

