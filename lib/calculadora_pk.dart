library calculadora_pk;

import 'package:url_launcher/url_launcher.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

void abrirCalculadora() async {
  const url = 'calculator:';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Não foi possível abrir a calculadora.';
  }
}
