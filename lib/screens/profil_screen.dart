import 'package:flutter/material.dart';

import '../widgets/profil_info_widget.dart';
import 'logout.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreen();
}

class _ProfilScreen extends State<ProfilScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: const Color(0xffffffff),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/hadara.png"),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text("Mouhamadou Mansour Ndiaye",
                              style: TextStyle(
                                fontSize: 20,
                              )
                          ),
                        ),
                        TextButton(
                            onPressed:() {},
                            child: Text("Modifier")
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ),
            const SizedBox(height: 15),
            const ProfilInfoWidget(
              title: "Numéro téléphone",
              value: "221 77 876 76 56",
            ),
            const SizedBox(height: 15),
            const ProfilInfoWidget(
              title: "Adresse email",
              value: "mndiaye@edahira.com",
            ),
            Card(
              color: const Color(0xffffffff),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          await logout(context);
                        },
                        child: Text("Déconnexion",
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF22763D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                        )
                        ),
                    )
                  ]
                )
            )
            ),
          ],
        ),
      )

    );
  }
}