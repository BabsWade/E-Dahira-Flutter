// audio_manager.dart
import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  final AudioPlayer _player = AudioPlayer();
  String? _currentUrl;

  final _listeners = <void Function(String?)>[];

  AudioManager._internal() {
    _player.onPlayerComplete.listen((_) {
      _currentUrl = null;
      _notifyListeners();
    });
  }

  void addListener(void Function(String?) listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function(String?) listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener(_currentUrl);
    }
  }

  Future<void> play(String url) async {
    if (_currentUrl != url) {
      await _player.stop();
      await _player.play(UrlSource(url));
      _currentUrl = url;
      _notifyListeners();
    } else {
      await pause();
    }
  }

  Future<void> pause() async {
    await _player.pause();
    _currentUrl = null;
    _notifyListeners();
  }

  String? get currentUrl => _currentUrl;
}
