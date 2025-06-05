import 'package:flutter/material.dart';
import '../models/audio_model.dart';
import '../widgets/audio_player_widgets.dart';

class ChapterDetailScreen extends StatelessWidget {
  final int chapitreId;
  final String themeName;
  final String chapterTitle;
  final int auteurId;
  final String authorName;
  final String imagePath;
  final List<AudioModel> audios;

  const ChapterDetailScreen({
    super.key,
    required this.chapitreId,
    required this.themeName,
    required this.chapterTitle,
    required this.auteurId,
    required this.authorName,
    required this.imagePath,
    required this.audios,
  });

  @override
  Widget build(BuildContext context) {
    // Tri des audios par date
    audios.sort((a, b) => a.audioDate.compareTo(b.audioDate));

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imagePath.isNotEmpty
                  ? Image.asset(imagePath, width: double.infinity, height: 200, fit: BoxFit.cover)
                  : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 60),
                    ),
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
              "Par $authorName",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),

            const Text(
              "Audios disponibles",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            audios.isEmpty
                ? const Text('Aucun audio disponible pour ce chapitre.')
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: audios.length,
                    itemBuilder: (context, index) {
                      final item = audios[index];

                      return Card(
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color(0xffCFE9D7),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Image.asset('assets/hadara.png', width: 50),
                          title: Text(
                            item.sequence.sequence?.isNotEmpty == true
                                ? item.sequence.sequence!
                                : item.chapitre.nomChapitre,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "${item.auteur.prenom} ${item.auteur.nom}",
                            style: const TextStyle(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: SimpleAudioPlayer(audioUrl: item.audioFile),
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