// screens/chapitre_list_screen.dart
import 'package:flutter/material.dart';
import '../models/chapitre.dart';
import '../services/chapitre_service.dart';

class ChapitreListScreen extends StatelessWidget {
  final int themeId;
  final String themeName;

  const ChapitreListScreen({super.key, required this.themeId, required this.themeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chapitres de $themeName')),
      body: FutureBuilder<List<ChapitreModel>>(
        future: ChapitreService.fetchChapitresByTheme(themeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun chapitre disponible.'));
          }

          final chapitres = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: chapitres.length,
            itemBuilder: (context, index) {
              final chapitre = chapitres[index];
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
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.book,
                        color: Color(0xff22763D),
                        size: 40,
                      ),
                    ),
                    title: Text(
                      chapitre.nomChapitre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff22763D),
                      ),
                    ),
                    // Optionnel : trailing bouton ou autre widget si besoin
                    // trailing: ...
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
