import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer _tapXPlayer = AudioPlayer();
  final AudioPlayer _tapOPlayer = AudioPlayer();
  final AudioPlayer _tapPlayer = AudioPlayer();
  bool _isMuted = false;

  Future<void> tapX() async {
    await _tapXPlayer.play(AssetSource('audio/tap_x_sound.mp3'));
  }

  Future<void> tapO() async {
    await _tapOPlayer.play(AssetSource('audio/tap_o_sound.mp3'));
  }

  Future<void> tap() async {
    await _tapPlayer.play(AssetSource('audio/tap_sound.mp3'));
  }

  void toggleMute() {
    _isMuted = !_isMuted;
  }

  void dispose() {
    _tapXPlayer.dispose();
  }
}
