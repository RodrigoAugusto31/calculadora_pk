library calculadora_pk;
import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

void openCalculator() {
  runApp(CalculatorApp());
}
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: CalculatorScreen(),
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

  void _handleNumberPress(String number) {
    setState(() {
      _currentValue += number;
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
    }

    setState(() {
      _displayValue = _result.toString();
    });
  }

  void _handleClearPress() {
    setState(() {
      _currentValue = '';
      _displayValue = '0';
      _result = 0;
      _operator = '';
    });
  }

  Widget _buildButton(String label, Function() onPressed) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow, // Definindo a cor de fundo
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
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayValue,
                style: TextStyle(fontSize: 48),
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
            child: Text(
              'Clear',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: _handleClearPress,
          ),
        ],
      ),
    );
  }
}


