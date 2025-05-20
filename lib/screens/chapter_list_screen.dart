import 'package:flutter/material.dart';
import 'chapter_detail_screen.dart';

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
onTap: () {
  final raw = item['sequences'];
  final sequences = (raw != null && raw is List)
      ? raw.map<Map<String, String>>((e) => Map<String, String>.from(e as Map)).toList()
      : <Map<String, String>>[];

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChapterDetailScreen(
        themeName: themeName,
        chapterTitle: item['title']!,
        author: item['subtitle']!,
        imagePath: item['image']!,
        sequences: sequences,
      ),
    ),
  );
},




              leading: Image.asset(item['image']!),
              title: Text(item['title']!),
              subtitle: Text(item['subtitle']!),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle_fill_outlined,
                  color: Color(0xff22763D),
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
