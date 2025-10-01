import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modern_chat_app/components/chat_tile.dart';
import 'package:modern_chat_app/pages/chat_page.dart';
import 'package:modern_chat_app/pages/home_page.dart';
import 'package:modern_chat_app/pages/nav_bar.dart';
import 'package:modern_chat_app/services/auth/loginOrRegister.dart';
import 'package:modern_chat_app/services/theme/theme_prvider.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
