import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/audio_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  final AudioModel audio;
  final String chapterImage;

  const AudioPlayerScreen({
    super.key,
    required this.audio,
    required this.chapterImage,
  });

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setSourceUrl(widget.audio.audioFile);

      _player.onDurationChanged.listen((d) {
        setState(() => _duration = d);
      });

      _player.onPositionChanged.listen((p) {
        setState(() => _position = p);
      });

      _player.onPlayerComplete.listen((_) {
        setState(() {
          _isPlaying = false;
          _position = Duration.zero;
        });
      });
    } catch (e) {
      debugPrint("Erreur lors du chargement de l'audio : $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}';
  }

  @override
  Widget build(BuildContext context) {
    final audio = widget.audio;
    final String imageUrl =
    audio.audioImage.isNotEmpty ? audio.audioImage : widget.chapterImage;
    final String audioTitle = audio.audioName.isNotEmpty
        ? audio.audioName
        : audio.sequence.sequence;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),      // Blanc pur
              Color(0xFFF0FFF0),      // Vert très très pâle
              Color(0xFF4CAF50),      // Vert Samsung Music
            ],
            stops: [0.0, 0.6, 1.0],   // Transition lente vers le vert
          ),
        ),


        child: Column(
          children: [
            // ✅ Décaler l'image sous l'AppBar
            const SizedBox(height: kToolbarHeight + 30),

            // ✅ IMAGE
            SizedBox(
              height: 250,
              width: double.infinity,
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/default_cover.jpg', fit: BoxFit.cover),
              )
                  : Image.asset('assets/default_cover.jpg', fit: BoxFit.cover),
            ),

            // ✅ INFOS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
              child: Column(
                children: [
                  Text(
                    audioTitle,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${audio.auteur.prenom} ${audio.auteur.nom}",
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ✅ CONTROLS EN BAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  Slider(
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
                    onChanged: (value) async {
                      final pos = Duration(seconds: value.toInt());
                      await _player.seek(pos);
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(_position), style: const TextStyle(color: Colors.white)),
                      Text(formatTime(_duration), style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10, size: 30, color: Colors.white),
                        onPressed: () {
                          final newPos = _position - const Duration(seconds: 10);
                          _player.seek(newPos > Duration.zero ? newPos : Duration.zero);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 64,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (_isPlaying) {
                            await _player.pause();
                          } else {
                            await _player.resume();
                          }
                          setState(() => _isPlaying = !_isPlaying);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10, size: 30, color: Colors.white),
                        onPressed: () {
                          final newPos = _position + const Duration(seconds: 10);
                          _player.seek(newPos < _duration ? newPos : _duration);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}