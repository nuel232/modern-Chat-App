import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:modern_chat_app/services/auth/auth_gate.dart';
import 'package:modern_chat_app/services/auth/loginOrRegister.dart';
import 'package:modern_chat_app/services/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Show loading indicator while Firebase initializes
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }

          // Show error if initialization fails
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error initializing app: ${snapshot.error}'),
              ),
            );
          }

          // Once Firebase is initialized, show AuthGate
          return AuthGate();
        },
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
