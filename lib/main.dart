/* Nickolas Minder, Oziel Paixão, Sergio Gentile*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  void _calculateIMC() {
    final double weight = double.parse(_weightController.text);
    final double height = double.parse(_heightController.text);
    final double imc = weight / (height * height);

    setState(() {
      if (imc < 18.5) {
        _result = "Abaixo do peso (IMC: ${imc.toStringAsFixed(2)})";
      } else if (imc >= 18.5 && imc < 24.9) {
        _result = "Peso normal (IMC: ${imc.toStringAsFixed(2)})";
      } else if (imc >= 25 && imc < 29.9) {
        _result = "Sobrepeso (IMC: ${imc.toStringAsFixed(2)})";
      } else {
        _result = "Obesidade (IMC: ${imc.toStringAsFixed(2)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Calculadora de IMC (Nickolas Minder, Oziel Paixão, Sergio Gentile)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
