import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modern_chat_app/components/my_button.dart';
import 'package:modern_chat_app/components/my_textfield.dart';
import 'package:modern_chat_app/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login(BuildContext context) async {
      //auth service
      final authService = AuthService();

      //try login
      try {
        await authService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
      }
      //catch error
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icon
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: 70,
                  child: Icon(
                    CupertinoIcons.chat_bubble_fill,
                    size: 70,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  // color: Colors.white,
                ),

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

                SizedBox(height: 25),

                //email textfield
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                //password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
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

                SizedBox(height: 25),

                //login button
                MyButton(text: 'Login', onTap: () => login(context)),

                SizedBox(height: 25),

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
      ),
    );
  }
}
