// ignore_for_file: deprecated_member_use

import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signupwithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("pass dosent match !!"),
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
                size: 70,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 30),

              // welcome back, you've been missed!
              Text(
                'lets create a new account for you !!',
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

              MyTextField(
                controller: _confirmpwController,
                hintText: ' confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MyButton(
                  text: "register",
                  onTap: () => register(context),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'already have an account',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'login now',
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
