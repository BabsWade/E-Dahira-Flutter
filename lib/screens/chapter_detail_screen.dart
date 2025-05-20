import 'package:flutter/material.dart';
import 'package:edahira/widgets/audio_player_widget.dart';

class ChapterDetailScreen extends StatelessWidget {
  final String themeName;
  final String chapterTitle;
  final String author;
  final String imagePath;
  final List<Map<String, String>> sequences;

  const ChapterDetailScreen({
    super.key,
    required this.themeName,
    required this.chapterTitle,
    required this.author,
    required this.imagePath,
    required this.sequences,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapterTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + infos
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              themeName,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              chapterTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Par $author",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),

            // Liste des séquences
            const Text(
              "Séquences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sequences.length,
              itemBuilder: (context, index) {
                final sequence = sequences[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.audiotrack, color: Color(0xff22763D)),
                    title: Text(sequence['title'] ?? 'Séquence'),
                    subtitle: Text(sequence['subtitle'] ?? ''),
                    trailing: AudioPlayerWidget(
                      audioUrl: sequence['audioUrl'] ?? '',  // Utiliser le bon champ
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
