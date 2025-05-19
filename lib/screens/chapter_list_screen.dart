import 'package:flutter/material.dart';
import 'package:edahira/screens/chapter_detail_screen.dart';

class ChapterListScreen extends StatelessWidget {
  final String themeName;
  final List<Map<String, dynamic>> waxtaanItems;

  const ChapterListScreen({
    super.key,
    required this.themeName,
    required this.waxtaanItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapitres : $themeName"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: waxtaanItems.length,
        itemBuilder: (context, index) {
          final item = waxtaanItems[index];

          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(item['image'] ?? 'assets/hadara.png'),
              title: Text(item['title'] ?? 'Titre inconnu'),
              subtitle: Text(item['subtitle'] ?? 'Auteur inconnu'),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color(0xff22763D),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterDetailScreen(
                      themeName: themeName,
                      chapterTitle: item['title'] ?? '',
                      author: item['subtitle'] ?? '',
                      imagePath: item['image'] ?? '',
                      sequences: List<Map<String, String>>.from(
                        item['sequences'] ?? [],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
