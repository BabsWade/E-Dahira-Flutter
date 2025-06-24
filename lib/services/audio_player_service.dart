import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  Duration _duration = Duration.zero;
  Duration get duration => _duration;

  Duration _position = Duration.zero;
  Duration get position => _position;

  String? _currentUrl;
  String? get currentUrl => _currentUrl;

  AudioPlayerService() {
    _player.onDurationChanged.listen((d) {
      _duration = d;
      notifyListeners();
    });

    _player.onPositionChanged.listen((p) {
      _position = p;
      notifyListeners();
    });

    _player.onPlayerComplete.listen((event) {
      _isPlaying = false;
      _position = Duration.zero;
      notifyListeners();
    });
  }

  Future<void> play(String url) async {
    if (_currentUrl == url) {
      await _player.resume();
    } else {
      await _player.stop();
      await _player.setSourceUrl(url);
      _currentUrl = url;
      await _player.resume();
    }

    _isPlaying = true;
    notifyListeners();
  }

  Future<void> pause() async {
    await _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    if (_currentUrl != null) {
      await _player.resume();
      _isPlaying = true;
      notifyListeners();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> stop() async {
    await _player.stop();
    _isPlaying = false;
    _position = Duration.zero;
    notifyListeners();
  }

  bool isAudioPlaying(String url) {
    return _currentUrl == url && _isPlaying;
  }
}
