import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key}); // Super parâmetro aplicado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adiciona um padding ao redor
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Alinhamento central
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Espaço entre os elementos
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(), // Adiciona borda ao campo
                ),
              ),
              const SizedBox(height: 20), // Espaço entre o campo e o botão
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
