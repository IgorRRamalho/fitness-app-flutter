import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _password;
  String? _confirmPassword;

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _buildHeader(context),
          _buildPasswordInputSection(),
          _buildResetButton(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: const Color(0xFF232323),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeaderContent(context),
            const SizedBox(height: 40),
            _buildHeaderText(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Stack(
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
          'Set Password',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE2F163),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderText() {
    return const Padding(
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
    );
  }

  Widget _buildPasswordInputSection() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          color: Color(0xFFB3A0FF),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPasswordField('Password', '*************', _passwordController),
              const SizedBox(height: 15),
              _buildPasswordField('Confirm Password', '*************', _confirmPasswordController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, String hint, TextEditingController controller) {
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
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xB3232323),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo está vazio';
              } else if (value.length < 8) {
                return 'Senha tem que ter no minímo 8 caracteres';
              } else if (controller == _confirmPasswordController && value != _passwordController.text) {
                return 'Senhas estão diferentes';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return Expanded(
      flex: 3,
      child: Container(
        color: const Color(0xFF232323),
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: const BorderSide(color: Colors.white),
                  ),
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: _resetPassword,
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
