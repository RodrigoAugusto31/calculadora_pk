library calculadora_pk;
import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

void openCalculator(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CalculatorApp()),
  );
}
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: CalculatorScreen(),
      debugShowCheckedModeBanner:false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _currentValue = '';
  String _displayValue = '0';
  double _result = 0;
  String _operator = '';
  String _expression = '';

  void _handleNumberPress(String number) {
  setState(() {
    _currentValue += number;
    _expression += number;
    _displayValue = _currentValue;
  });
}

  void _handleOperatorPress(String operator) {
  if (_currentValue.isNotEmpty) {
    double value = double.parse(_currentValue);

    if (_operator.isEmpty) {
      _result = value;
    } else {
      switch (_operator) {
        case '+':
          _expression += operator;
          _result += value;
          break;
        case '-':
        _expression += operator;
          _result -= value;
          break;
        case '*':
        _expression += operator;
          _result *= value;
          break;
        case '/':
        _expression += operator;
          _result /= value;
          break;
      }
    }

    _operator = operator;
    _currentValue = '';
  }
}

  void _handleEqualsPress() {
  if (_currentValue.isNotEmpty) {
    double value = double.parse(_currentValue);

    switch (_operator) {
      case '+':
        _result += value;
        break;
      case '-':
        _result -= value;
        break;
      case '*':
        _result *= value;
        break;
      case '/':
        _result /= value;
        break;
    }

    _operator = '';
    _currentValue = '';
    _expression = _result.toString();
  }

  setState(() {
    _displayValue = _expression;
  });
}

  void _handleClearPress() {
    setState(() {
      _currentValue = '';
      _displayValue = '0';
      _result = 0;
      _operator = '';
      _expression = '';
    });
  }

  Widget _buildButton(String label, Function() onPressed) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow[200],
   body: Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.bottomRight,
            child: Text(
              _expression,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
          Divider(
            height: 0,
            thickness: 2,
          ),
          Row(
            children: [
              _buildButton('7', () => _handleNumberPress('7')),
              _buildButton('8', () => _handleNumberPress('8')),
              _buildButton('9', () => _handleNumberPress('9')),
              _buildButton('/', () => _handleOperatorPress('/')),
            ],
          ),
          Row(
            children: [
              _buildButton('4', () => _handleNumberPress('4')),
              _buildButton('5', () => _handleNumberPress('5')),
              _buildButton('6', () => _handleNumberPress('6')),
              _buildButton('*', () => _handleOperatorPress('*')),
            ],
          ),
          Row(
            children: [
              _buildButton('1', () => _handleNumberPress('1')),
              _buildButton('2', () => _handleNumberPress('2')),
              _buildButton('3', () => _handleNumberPress('3')),
              _buildButton('-', () => _handleOperatorPress('-')),
            ],
          ),
          Row(
            children: [
              _buildButton('0', () => _handleNumberPress('0')),
              _buildButton('.', () => _handleNumberPress('.')),
              _buildButton('=', _handleEqualsPress),
              _buildButton('+', () => _handleOperatorPress('+')),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
            ),
            child: Text(
              'Limpar',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: _handleClearPress,
          ),
        ],
      ),
    );
  }
}

