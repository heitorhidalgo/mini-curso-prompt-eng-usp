import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppLista());
}

class MeuAppLista extends StatelessWidget {
  const MeuAppLista({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaListaTarefas(),
    );
  }
}

class TelaListaTarefas extends StatefulWidget {
  const TelaListaTarefas({super.key});

  @override
  State<TelaListaTarefas> createState() => _TelaListaTarefasState();
}

class _TelaListaTarefasState extends State<TelaListaTarefas> {
  // 1. A fonte da verdade: nossa lista de tarefas
  final List<String> _tarefas = [];

  // 2. O "controle remoto" do campo de texto
  final TextEditingController _controller = TextEditingController();

  void _adicionarTarefa() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tarefas.add(_controller.text); // Adiciona na lista
        _controller.clear(); // Limpa o campo de texto
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista Dinâmica Flutter")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Campo de texto expandido
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Nova tarefa",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Botão de adicionar
                ElevatedButton(
                  onPressed: _adicionarTarefa,
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          // Lista expandida para ocupar o resto da tela
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(_tarefas[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}