import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SimpleAudioPlayer extends StatefulWidget {
  final String audioUrl;
  const SimpleAudioPlayer({super.key, required this.audioUrl});

  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() => _isPlaying = false);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() => _isPlaying = false);
    } else {
      try {
        await _audioPlayer.play(UrlSource(widget.audioUrl));
        setState(() => _isPlaying = true);
      } catch (e) {
        debugPrint('Erreur lecture audio : $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lecture audio : $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isPlaying ? Icons.pause_circle : Icons.play_circle, size: 40, color: Color(0xff22763D),),
      onPressed: _togglePlayPause,
    );
  }
}
