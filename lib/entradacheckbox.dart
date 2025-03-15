import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  // Lista com as opções de abastecimento
  List<String> _opcoes = ['Álcool', 'Gasolina'];
  
  // Lista para armazenar as opções selecionadas
  List<bool> _selecionados = [false, false];
  
  // Texto que vai mostrar as opções selecionadas
  String _textoSelecionado = 'Nenhuma opção selecionada';

  void _atualizarTexto() {
    List<String> selecionados = [];
    for (int i = 0; i < _opcoes.length; i++) {
      if (_selecionados[i]) {
        selecionados.add(_opcoes[i]);
      }
    }
    setState(() {
      _textoSelecionado = selecionados.isNotEmpty
          ? 'Você escolheu: ${selecionados.join(' e ')}'
          : 'Nenhuma opção selecionada';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              "Escolha qual combustível prefere:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Lista de Checkboxes
            Column(
              children: List.generate(_opcoes.length, (index) {
                return CheckboxListTile(
                  title: Text(_opcoes[index]),
                  value: _selecionados[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _selecionados[index] = value!;
                    });
                    _atualizarTexto(); // Atualiza o texto com as opções selecionadas
                  },
                );
              }),
            ),

            SizedBox(height: 20),

            // Texto mostrando as opções selecionadas
            Text(
              _textoSelecionado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
