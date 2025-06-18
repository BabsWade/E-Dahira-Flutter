import 'package:flutter/material.dart';
import '../models/theme.dart';
import '../services/api_service.dart';
import 'chapter_list_screen.dart';

class ThemeListScreen extends StatelessWidget {
  const ThemeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder<List<ThemeModel>>(
        future: ApiService.fetchThemes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun thème disponible.'));
          }

          final themes = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: themes.length,
            itemBuilder: (context, index) {
              final theme = themes[index];
              return Card(
                color: const Color(0xffCFE9D7),
                elevation: 0,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapitreListScreen(
                            themeId: theme.id,
                            themeName: theme.nomTheme,
                          ),
                        ),
                      );
                    },
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.topic,
                        color: Color(0xff22763D),
                        size: 40,
                      ),
                    ),
                    title: Text(
                      theme.nomTheme,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff22763D),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff22763D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Voir chapitres",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}