library calculadora_pk;
import 'package:url_launcher/url_launcher.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

void openCalculator() async {
  const url = 'calculator://'; // URL de exemplo, pode variar dependendo do dispositivo
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir a calculadora';
  }
}
}

