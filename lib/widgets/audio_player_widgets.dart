// simple_audio_player.dart
import 'package:flutter/material.dart';
import 'package:edahira/services/audio_manager.dart';

class SimpleAudioPlayer extends StatefulWidget {
  final String audioUrl;
  const SimpleAudioPlayer({super.key, required this.audioUrl});

  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  bool _isPlaying = false;
  final _audioManager = AudioManager();

  @override
  void initState() {
    super.initState();
    _audioManager.addListener(_onAudioChanged);
    _isPlaying = _audioManager.currentUrl == widget.audioUrl;
  }

  void _onAudioChanged(String? currentUrl) {
    setState(() {
      _isPlaying = currentUrl == widget.audioUrl;
    });
  }

  @override
  void dispose() {
    _audioManager.removeListener(_onAudioChanged);
    super.dispose();
  }

  Future<void> _togglePlayPause() async {
    await _audioManager.play(widget.audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPlaying ? Icons.pause_circle : Icons.play_circle,
        size: 40,
        color: const Color(0xff22763D),
      ),
      onPressed: _togglePlayPause,
    );
  }
}
