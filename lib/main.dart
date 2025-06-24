import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/audio_player_service.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AudioPlayerService(),
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
      title: 'E-dahira',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCFE9D7)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
