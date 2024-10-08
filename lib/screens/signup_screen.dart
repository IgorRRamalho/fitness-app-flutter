import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key}); // Super parâmetro aplicado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding para espaçamento
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Alinhamento do conteúdo
            children: [
              const Text(
                'Sign Up', // Adiciona 'const' para otimização
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold), // Estilo do título
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre o título e o campo de texto
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name', // Adiciona 'const' para otimização
                  border: OutlineInputBorder(), // Borda para o campo de texto
                ),
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre os campos de texto
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email', // Adiciona 'const' para otimização
                  border: OutlineInputBorder(), // Borda para o campo de texto
                ),
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre os campos de texto
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password', // Adiciona 'const' para otimização
                  border: OutlineInputBorder(), // Borda para o campo de texto
                ),
                obscureText: true, // Esconde o texto da senha
              ),
              const SizedBox(height: 20), // Espaçamento antes do botão
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navega para a tela anterior
                },
                child: const Text(
                    'Back to Login'), // Adiciona 'const' para otimização
              ),
            ],
          ),
        ),
      ),
    );
  }
}
