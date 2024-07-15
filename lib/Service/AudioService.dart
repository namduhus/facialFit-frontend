import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  factory AudioService() {
    return _instance;
  }

  AudioService._internal() {
    _audioPlayer = AudioPlayer();
  }

  Future<void> playBackgroundMusic() async {
    if (!_isPlaying) {
      await _audioPlayer.play(AssetSource('Fun.mp3'), volume: 0.5);
      _isPlaying = true;
    }
  }

  Future<void> stopBackgroundMusic() async {
    await _audioPlayer.stop();
    _isPlaying = false;
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  bool get isPlaying => _isPlaying;
}