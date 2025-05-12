
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembreScreen extends StatefulWidget{
  const MembreScreen({Key? key}) : super(key: key);

  @override
  State<MembreScreen> createState() => _MembreScreenState();
}

class _MembreScreenState extends State<MembreScreen> {
  String? selectedValue;
  String? onSelected;
  List<String> items = ['Toutes', 'Hauteur', 'Theme', 'Chapitre'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dalal ak jam",
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
              ]
            ),
            SizedBox(height: 20,),
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
                    Text("Restez connecté à votre hadara",
                    style: TextStyle(
                      fontSize: 22,

                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/hadara.png",
                          height: 80,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.play_circle_fill_outlined,
                          size: 60,
                          color: Color(0xff22763D),
                        )
                        )
                      ]
                    ),
                  ],
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                hintText: "Recherche",
                prefixIcon: Icon(Icons.search,
                  color: Color(0xff22763D),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Waxtaan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20,),

            // Boutons de filtre
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                      label: Text("Toutes",
                        style: TextStyle(
                          fontSize: 18,)
                      ),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Toutes",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Toutes";
                        });
                      }
                  ),
                  SizedBox(width: 10,),
                  FilterChip(
                      label: Text("Hauteur",
                          style: TextStyle(
                            fontSize: 18,)
                      ),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Hauteur",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Hauteur";
                        });
                      }
                  ),
                  SizedBox(width: 10,),
                  FilterChip(
                      label: Text("Thème",
                          style: TextStyle(
                            fontSize: 18,)
                      ),
                      backgroundColor: Color(0xffCFE9D7),
                      selected: selectedValue == "Thème",
                      onSelected: (bool selected) {
                        setState(() {
                          selectedValue = "Thème";
                        });
                      }
                  ),
                  SizedBox(width: 10,),

                ]
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset("assets/hadara.png",),
                    title: Text("Khilassou Zahab "),
                    subtitle: Text("Oustaz Wade"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_circle_fill_outlined,
                      color: Color(0xff22763D),
                        size: 40,
                      )
                    ),
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }

}