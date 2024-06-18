// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signinwithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.message,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 30),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: _emailController,
                hintText: 'email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: _pwController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              MyButton(
                text: "login",
                onTap: () => login(context),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Not a member?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
