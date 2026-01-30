import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // Dica: Visual mais moderno com botões maiores
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  // Variáveis de controle
  String _visor = "";       // O que o usuário vê (ex: "5 + 5")
  String _num1 = "";        // Primeiro número guardado na memória
  String _operacao = "";    // Operação guardada (+, -, X, /)
  String _buffer = "";      // O número que está sendo digitado AGORA
  bool _novoCalculo = true; // Flag para saber se devemos limpar a tela ao digitar

  void buttonPressed(String textoBotao) {
    setState(() {
      // 1. Lógica para LIMPAR (C)
      if (textoBotao == "C") {
        _visor = "";
        _num1 = "";
        _operacao = "";
        _buffer = "";
        _novoCalculo = true;
      }
      // 2. Lógica para RESULTADO (=)
      else if (textoBotao == "=") {
        if (_operacao.isNotEmpty && _buffer.isNotEmpty) {
          double n1 = double.parse(_num1);
          double n2 = double.parse(_buffer);
          double resultado = 0.0;

          if (_operacao == "+") resultado = n1 + n2;
          if (_operacao == "-") resultado = n1 - n2;
          if (_operacao == "X") resultado = n1 * n2;
          if (_operacao == "/") resultado = n1 / n2;

          // Formatação para remover o ".0" (ex: 10.0 vira 10)
          String resultadoFormatado = resultado.toString();
          if (resultadoFormatado.endsWith(".0")) {
            resultadoFormatado = resultadoFormatado.replaceAll(".0", "");
          }

          _visor = resultadoFormatado; // Mostra o resultado final
          _buffer = resultadoFormatado; // Guarda o resultado caso queira continuar a conta
          _operacao = ""; // Reseta a operação
          _novoCalculo = true; // Próximo número digitado limpará a tela
        }
      }
      // 3. Lógica para OPERADORES (+, -, X, /)
      else if (["+", "-", "X", "/"].contains(textoBotao)) {
        if (_buffer.isNotEmpty) {
          _num1 = _buffer; // Salva o número atual
          _operacao = textoBotao; // Salva a operação
          _visor = "$_num1 $_operacao "; // Mostra "5 + " no visor
          _buffer = ""; // Limpa o buffer para receber o segundo número
          _novoCalculo = false;
        }
      }
      // 4. Lógica para NÚMEROS (0-9 e .)
      else {
        // Se acabou de fazer uma conta (=), limpa tudo ao digitar um número novo
        if (_novoCalculo) {
          _visor = textoBotao;
          _buffer = textoBotao;
          _novoCalculo = false;
          _num1 = "";
          _operacao = "";
        } else {
          // Senão, continua digitando (concatena)
          _buffer += textoBotao;
          // Se já tem operação, mostra "Num1 + Num2", senão só "Num1"
          if (_operacao.isNotEmpty) {
            _visor = "$_num1 $_operacao $_buffer";
          } else {
            _visor = _buffer;
          }
        }
      }
    });
  }

  // Widget auxiliar para construir os botões
  Widget buildButton(String texto) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4), // Espacinho entre botões
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // Destaque visual para operadores
            backgroundColor: ["=", "+", "-", "X", "/", "C"].contains(texto)
                ? Colors.deepPurple.shade100
                : Colors.white,
            foregroundColor: Colors.black, // Cor do texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(texto),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Calculadora Flutter")),
      body: Column(
        children: <Widget>[
          // VISOR
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Text(
                _visor.isEmpty ? "0" : _visor, // Se vazio, mostra 0
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const Divider(height: 1),

          // TECLADO (Reorganizado: 1-2-3 em cima, 7-8-9 embaixo)
          SizedBox(
            height: 400, // Altura fixa para o teclado
            child: Column(
              children: [
                Expanded(child: Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("/")])),
                Expanded(child: Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("X")])),
                Expanded(child: Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("-")])),
                Expanded(child: Row(children: [buildButton("C"), buildButton("0"), buildButton("."), buildButton("+")])),
                Expanded(child: Row(children: [buildButton("=")])), // Botão de igual ocupa toda a largura
              ],
            ),
          )
        ],
      ),
    );
  }
}