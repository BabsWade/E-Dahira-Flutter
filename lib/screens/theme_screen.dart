import 'package:flutter/material.dart';
import 'chapter_list_screen.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  final List<Map<String, dynamic>> themes = const [
    {
      'name': 'Set',
      'image': 'assets/hadara.png',
      'chapters': [
        {
          'title': 'Les bases de Set',
          'subtitle': 'Oustaz Wade',
          'image': 'assets/hadara.png',
        },
        {
          'title': 'Approfondissement',
          'subtitle': 'Oustaz Wade',
          'image': 'assets/hadara.png',
        },
      ],
    },
    {
      'name': 'Weurseug',
      'image': 'assets/hadara.png',
      'chapters': [
        {
          'title': 'Introduction Weurseug',
          'subtitle': 'Oustaz Ndiaye',
          'image': 'assets/hadara.png',
        },
        {
          'title': 'Pratique avancée',
          'subtitle': 'Oustaz Ndiaye',
          'image': 'assets/hadara.png',
        },
      ],
    },
    {
      'name': 'Seuy',
      'image': 'assets/hadara.png',
      'chapters': [
        {
          'title': 'Seuy élémentaire',
          'subtitle': 'Oustaz Ba',
          'image': 'assets/hadara.png',
        },
      ],
    },
    {
      'name': 'Weer',
      'image': 'assets/hadara.png',
      'chapters': [],
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterListScreen(
                      themeName: theme['name'],
                      waxtaanItems:
                          List<Map<String, String>>.from(theme['chapters']),
                    ),
                  ),
                );
              },
              leading: Image.asset(
                theme['image'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                theme['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff22763D),
                ),
              ),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff22763D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${theme['chapters'].length} chapitres", // ✅ CORRIGÉ ICI
                  style: const TextStyle(
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
  }
}
