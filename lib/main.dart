import 'package:flutter/material.dart';

void main() {
  runApp(const CadastroApp());
}

class CadastroApp extends StatelessWidget {
  const CadastroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _realizarCadastro() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso! 🚀'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Simulação de envio
      print("Nome: ${_nomeController.text}");
      print("Email: ${_emailController.text}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verifique os erros em vermelho.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Cadastro de usuário")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_add, size: 80, color: Colors.indigo),
              const SizedBox(height: 20),

              // CAMPO NOME
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                    labelText: "Nome Completo",
                    prefixIcon: Icon(Icons.person),
                    helperText: "Nome e Sobrenome" // Dica visual extra
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, digite seu nome.';
                  if (value.trim().split(' ').length < 2) return 'Digite nome e sobrenome.';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // CAMPO EMAIL
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "E-mail", prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'O e-mail é obrigatório.';
                  // Regex robusto para e-mail
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) return 'Digite um e-mail válido (ex: .com ou .br)';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // CAMPO SENHA (ATUALIZADO)
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    helperText: "Mín. 8 caracteres, 1 maiúscula e 1 número",
                    helperMaxLines: 2
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'A senha é obrigatória.';

                  // Regra 1: Tamanho mínimo
                  if (value.length < 8) return 'A senha deve ter no mínimo 8 caracteres.';

                  // Regra 2: Pelo menos um número
                  if (!value.contains(RegExp(r'[0-9]'))) return 'A senha deve conter pelo menos um número.';

                  // Regra 3: Pelo menos uma letra maiúscula
                  if (!value.contains(RegExp(r'[A-Z]'))) return 'A senha deve conter uma letra maiúscula.';

                  return null;
                },
              ),
              const SizedBox(height: 32),

              // BOTÃO
              ElevatedButton(
                onPressed: _realizarCadastro,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text("CRIAR CONTA", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}