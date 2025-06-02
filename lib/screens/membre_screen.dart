import 'package:flutter/material.dart';
import '../models/audio_model.dart';
import '../services/audio_service.dart';
import '../widgets/audio_player_widgets.dart';

class MembreScreen extends StatefulWidget {
  const MembreScreen({super.key});
  @override
  State<MembreScreen> createState() => _MembreScreen();
}

class _MembreScreen extends State<MembreScreen> {

  // Ajout du chargement des audios
  late Future<List<AudioModel>> futureAudios;

  @override
void initState() {
  super.initState();
  futureAudios = AudioService.fetchAudios(); // ✅ pas de filtres ici
}



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
            "Les conférences les plus récentes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          FutureBuilder<List<AudioModel>>(
            future: futureAudios,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('Aucune conférence disponible');
              }

              final audios = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: audios.length > 20 ? 20 : audios.length,
                itemBuilder: (context, index) {
                  final item = audios[index];
                  print("Audio URL: ${item.audioFile}");
                  print("Audio URL: ${item.audioFile}");

                  return Container(
                    // ajuste selon  mes besoins
                    constraints: const BoxConstraints(minHeight: 100), // ajuste selon  besoins
                    child: Card(
                      elevation: 0,
                      color: const Color(0xffCFE9D7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Image.asset('assets/hadara.png', width: 50),
                        title: Text(
"${item.sequence.sequence?.isNotEmpty == true ? item.sequence.sequence! : item.chapitre.nomChapitre}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1, // Limite à une ligne
                          overflow: TextOverflow.ellipsis, // Ajoute "..." si trop long
                        ),
                        subtitle: Text(
                          "${item.auteur.prenom} ${item.auteur.nom}",
                          style: const TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: SimpleAudioPlayer(audioUrl: item.audioFile),
                      ),
                    ),
                  );

                },
              );
            },
          ),
        ],
      ),
    );
  }
}