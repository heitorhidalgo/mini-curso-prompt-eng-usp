import 'package:flutter/material.dart';

void main() {
  runApp(const AppCorrigido());
}

class AppCorrigido extends StatelessWidget {
  const AppCorrigido({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaPerfil(),
    );
  }
}

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  int _likes = 0;

  void _darLike() {
    // CORREÇÃO 1 (Lógica): Uso do setState para reconstruir a tela
    setState(() {
      _likes = _likes + 1;
    });
    print("Você deu like! Total: $_likes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Caça aos Bugs - Resolvido")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 20),

            Row(
              children: [
                // CORREÇÃO 2 (Layout): Expanded força o texto a quebrar linha e respeitar a largura
                Expanded(
                  child: const Text(
                    "Este é um texto de descrição muito longo que agora quebra a linha automaticamente e não causa mais erro de overflow.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              "Likes: $_likes",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _darLike,
              child: const Text("Dar Like"),
            ) // CORREÇÃO 3 (Sintaxe): Ponto e vírgula adicionado
          ],
        ),
      ),
    );
  }
}