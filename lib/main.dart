import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppEducativo());
}

class MeuAppEducativo extends StatelessWidget {
  const MeuAppEducativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String _mensagem = "Olá! Clique no botão abaixo.";

  void _atualizarMensagem() {
    setState(() {
      _mensagem = "Bem-vindo ao mundo do Prompt Engineering com Flutter!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício de Prompt"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _atualizarMensagem,
              child: const Text("Clique em mim"),
            )
          ],
        ),
      ),
    );
  }
}