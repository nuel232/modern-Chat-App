import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modern_chat_app/components/my_button.dart';
import 'package:modern_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                'Welcome back,we have missed you',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 20),

              //email textfield
              MyTextfield(
                controller: emailController,
                hint: Text('Email'),
                obscureText: false,
              ),

              SizedBox(height: 20),

              //password textfield
              MyTextfield(
                controller: passwordController,
                hint: Text('Password'),
                obscureText: true,
              ),

              SizedBox(height: 10),

              //forgot Password
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              //login button
              MyButton(text: 'Login', onTap: () {}),

              SizedBox(height: 10),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      ' Register now',
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
