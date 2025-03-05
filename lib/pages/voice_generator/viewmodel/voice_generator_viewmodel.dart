import 'package:mobx/mobx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ai_voice_generator/global.dart';
part 'voice_generator_viewmodel.g.dart';

class VoiceGeneratorViewModel = _VoiceGeneratorViewModelBase
    with _$VoiceGeneratorViewModel;

abstract class _VoiceGeneratorViewModelBase with Store {
  @observable
  double sliderValue = 0;

  @observable
  double maxValue = 1;

  @observable
  bool isPlaying = false;

  @observable
  bool shouldAutoStart = true;

  late AudioPlayer _audioPlayer;

  @action
  void initAudioPlayer() {
    _audioPlayer = AudioPlayer();

    // Player durumunu dinle
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying = false;
        sliderValue = 0;
        shouldAutoStart = false;
      }
    });

    // Pozisyon değişikliklerini dinle
    _audioPlayer.positionStream.listen((position) {
      sliderValue = position.inMilliseconds.toDouble();
      if (_audioPlayer.duration != null && position >= _audioPlayer.duration!) {
        sliderValue = 0;
        isPlaying = false;
        shouldAutoStart = false;
      }
    });

    loadAudio();
  }

  @action
  Future<void> loadAudio() async {
    try {
      if (tokenUrl.isEmpty) {
        print('Audio URL is empty');
        return;
      }

      final duration = await _audioPlayer.setUrl(
        tokenUrl,
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': '*/*',
        },
      );

      if (duration == null) {
        print('Failed to load audio - duration is null');
        return;
      }

      maxValue = duration.inMilliseconds.toDouble();
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @action
  void seekForward() {
    if (shouldAutoStart) {
      _audioPlayer.seek(
          Duration(milliseconds: _audioPlayer.position.inMilliseconds + 1000));
    }
  }

  @action
  void seekBackward() {
    if (shouldAutoStart) {
      const geriSarMiktari = 1000;
      final yeniPozisyon =
          _audioPlayer.position.inMilliseconds - geriSarMiktari;

      if (yeniPozisyon >= 0) {
        _audioPlayer.seek(Duration(milliseconds: yeniPozisyon));
        sliderValue = yeniPozisyon.toDouble();
      } else {
        _audioPlayer.seek(Duration.zero);
        sliderValue = 0;
      }
    }
  }

  @action
  Future<void> startAudio() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        if (_audioPlayer.duration != null &&
            _audioPlayer.position >= _audioPlayer.duration!) {
          await _audioPlayer.seek(Duration.zero);
          sliderValue = 0;
          shouldAutoStart = true;
        }
        await _audioPlayer.play();
      }

      isPlaying = !isPlaying;
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @action
  void updateSliderValue(double value) {
    if (shouldAutoStart) {
      sliderValue = value;
      _audioPlayer.seek(
        Duration(
          milliseconds: value.toInt(),
        ),
      );
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
