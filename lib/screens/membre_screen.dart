import 'package:flutter/material.dart';

class MembreScreen extends StatelessWidget {
  const MembreScreen({super.key});

  final List<Map<String, String>> waxtaanItems = const [
    {
      'title': 'Khilassou Zahab',
      'subtitle': 'Oustaz Wade',
      'image': 'assets/hadara.png',
    },
    {
      'title': 'Tafsir Joumou\'a',
      'subtitle': 'Oustaz Ndiaye',
      'image': 'assets/hadara.png',
    },
    {
      'title': 'Introduction à la Aqida',
      'subtitle': 'Oustaz Ba',
      'image': 'assets/hadara.png',
    },
    {
      'title': 'La Sira du Prophète',
      'subtitle': 'Oustaz Diallo',
      'image': 'assets/hadara.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: const Color(0xffCFE9D7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset("assets/edahira-logo.png", width: 50),
                  const SizedBox(height: 10),
                  const Text(
                    "Restez connecté à votre hadara",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/hadara.png", height: 80),
                      const Icon(
                        Icons.play_circle_fill_outlined,
                        size: 60,
                        color: Color(0xff22763D),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: "Recherche",
              prefixIcon: const Icon(Icons.search, color: Color(0xff22763D)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Waxtaan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_circle_fill_outlined,
                          color: Color(0xff22763D),
                          size: 40,
                        ),
                      )
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
