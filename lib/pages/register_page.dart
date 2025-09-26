import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modern_chat_app/components/my_button.dart';
import 'package:modern_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  TextEditingController emailController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              FaIcon(FontAwesomeIcons.message, size: 70),

              SizedBox(height: 40),

              //text
              Text(
                'Welcome, You made the right choice',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 10),

              //email textfield
              MyTextfield(
                controller: emailController,
                hint: Text('Email'),
                obscureText: false,
              ),

              SizedBox(height: 10),

              //password textfield
              MyTextfield(
                controller: passwordController,
                hint: Text('Password'),
                obscureText: true,
              ),

              SizedBox(height: 10),

              //Confirm password textfield
              MyTextfield(
                controller: ConfirmPasswordController,
                hint: Text('Confirm Password'),
                obscureText: true,
              ),

              SizedBox(height: 20),

              //login button
              MyButton(text: 'Sign Up', onTap: () {}),

              SizedBox(height: 10),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      ' Login',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
