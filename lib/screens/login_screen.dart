import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/UserStorageService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserStorageService _userStorageService = UserStorageService();

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Validação de email
    if (!_isValidEmail(email)) {
      _showDialog('Email inválido', 'Por favor, insira um email válido.');
      return;
    }

    // Validação de senha
    if (password.isEmpty) {
      _showDialog('Senha inválida', 'A senha não pode estar vazia.');
      return;
    }

    print('Email: $email');
    print('Senha: $password');

    bool userExists = await _userStorageService.checkUserExists(email, password);
    String title = userExists ? 'Usuário existe' : 'Usuário não encontrado';
    String content = userExists ? 'Login bem-sucedido!' : 'Verifique suas credenciais.';

    _showDialog(title, content);
  }

  bool _isValidEmail(String email) {
    // Regex para validação de email
    final RegExp emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegExp.hasMatch(email);
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFF232323),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 45,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: obscureText ? '*************' : 'example@example.com',
              hintStyle: const TextStyle(
                color: Color(0xB3232323),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF232323),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'lib/assets/Arrow.svg',
                              width: 6,
                              height: 11,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFE2F163),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE2F163),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFFB3A0FF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField('Username or email', _emailController),
                  _buildTextField('Password', _passwordController, obscureText: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/forgotPassword'),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF232323),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF232323),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(179, 44),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(color: Colors.white),
                      ),
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: _login,
                    child: const Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'or sign up with',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon('lib/assets/google_icon.svg'),
                      _socialIcon('lib/assets/facebook_icon.svg'),
                      _socialIcon('lib/assets/fingerprint_icon.svg'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/signup'),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            color: Color(0xFFE2F163),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return IconButton(
      icon: SvgPicture.asset(
        assetPath,
        width: 34,
        height: 34,
      ),
      onPressed: () {},
    );
  }
}
