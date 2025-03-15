import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Número inválido! Digite valores maiores que zero e utilizando ponto (.) para decimais.";
      });
      return;
    }

    double proporcao = precoAlcool / precoGasolina;

    setState(() {
      _textoResultado = proporcao >= 0.7
          ? "Melhor abastecer com GASOLINA"
          : "Melhor abastecer com ÁLCOOL";
    });

    _limparCampos(); // Limpa os campos automaticamente após o cálculo
  }

  void _limparCampos() {
    _controllerAlcool.clear();
    _controllerGasolina.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do álcool, ex.: 4.13",
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              controller: _controllerAlcool,
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço da gasolina, ex.: 6.09",
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              controller: _controllerGasolina,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(15),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Calcular"),
              onPressed: _calcular,
            ),
            SizedBox(height: 20),
            Text(
              _textoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
