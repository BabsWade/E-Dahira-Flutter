import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembreScreen extends StatefulWidget {
  const MembreScreen({Key? key}) : super(key: key);

  @override
  State<MembreScreen> createState() => _MembreScreenState();
}

class _MembreScreenState extends State<MembreScreen> {
  String? selectedValue;
  int _currentIndex = 0;

  List<String> items = ['Toutes', 'Auteur', 'Theme', 'Chapitre'];

  List<Map<String, String>> waxtaanItems = [
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
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dalal ak jam",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/edahira-logo.png",
                    width: 50,
                    height: 80,
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// Carte intro
              Card(
                color: Color(0xffCFE9D7),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/edahira-logo.png",
                        width: 50,
                      ),
                      Text(
                        "Restez connecté à votre hadara",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/hadara.png",
                            height: 80,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_fill_outlined,
                              size: 60,
                              color: Color(0xff22763D),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              /// Barre de recherche
              TextField(
                decoration: InputDecoration(
                  hintText: "Recherche",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff22763D),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 20),

              /// Titre section
              Text(
                "Waxtaan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              /// Filtres
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      label: Text("Toutes", style: TextStyle(fontSize: 18)),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Toutes",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Toutes";
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    FilterChip(
                      label: Text("Hauteur", style: TextStyle(fontSize: 18)),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Hauteur",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Hauteur";
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    FilterChip(
                      label: Text("Thème", style: TextStyle(fontSize: 18)),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Thème",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Thème";
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    FilterChip(
                      label: Text("Chapitre", style: TextStyle(fontSize: 18)),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Chapitre",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Chapitre";
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Liste waxtaan
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: waxtaanItems.length,
                itemBuilder: (context, index) {
                  final item = waxtaanItems[index];
                  return Card(
                    color: Color(0xffffffff),
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
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      /// Navigation inférieure
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color(0xffCFE9D7),
        selectedItemColor: Color(0xff22763D),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: Colors.black,
        unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff22763D)),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Color(0xff22763D)),
            label: "Tafsir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xff22763D)),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
