import 'package:edahira/screens/home_screen.dart';
import 'package:edahira/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-dahira',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCFE9D7)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),  // Assurez-vous que HomeScreen est passé ici
    );
  }
}
