import 'package:flutter/material.dart';

class ChapterListScreen extends StatelessWidget {
  final String themeName;
  final List<Map<String, String>> waxtaanItems;

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
              leading: Image.asset(item['image']!),
              title: Text(item['title']!),
              subtitle: Text(item['subtitle']!),
              trailing: IconButton(
                onPressed: () {
                  // Action de lecture
                },
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
