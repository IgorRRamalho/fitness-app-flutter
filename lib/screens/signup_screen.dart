import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/UserStorageService.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final userStorageService = UserStorageService();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF232323),
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                        'Create Account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE2F163),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let's start!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFFB3A0FF),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'John Doe',
                          hintStyle: const TextStyle(
                            color: Color(0xB3232323),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email or Mobile Number',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'example@example.com',
                          hintStyle: const TextStyle(
                            color: Color(0xB3232323),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: '*************',
                          hintStyle: const TextStyle(
                            color: Color(0xB3232323),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: '*************',
                          hintStyle: const TextStyle(
                            color: Color(0xB3232323),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF232323),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'By continuing, you agree to',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  const Text(
                    'Terms of Use and Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE2F163),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final newUser = User(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        await userStorageService.saveUser(newUser);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuario registrado com sucesso!'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Preencha todos os campos corretamente!'),
                          ),
                        );
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Sign Up',
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
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'lib/assets/google_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'lib/assets/facebook_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'lib/assets/fingerprint_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Log In',
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
}
