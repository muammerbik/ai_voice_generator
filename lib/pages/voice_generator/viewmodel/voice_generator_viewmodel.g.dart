// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_generator_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceGeneratorViewModel on _VoiceGeneratorViewModelBase, Store {
  late final _$sliderValueAtom =
      Atom(name: '_VoiceGeneratorViewModelBase.sliderValue', context: context);

  @override
  double get sliderValue {
    _$sliderValueAtom.reportRead();
    return super.sliderValue;
  }

  @override
  set sliderValue(double value) {
    _$sliderValueAtom.reportWrite(value, super.sliderValue, () {
      super.sliderValue = value;
    });
  }

  late final _$maxValueAtom =
      Atom(name: '_VoiceGeneratorViewModelBase.maxValue', context: context);

  @override
  double get maxValue {
    _$maxValueAtom.reportRead();
    return super.maxValue;
  }

  @override
  set maxValue(double value) {
    _$maxValueAtom.reportWrite(value, super.maxValue, () {
      super.maxValue = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_VoiceGeneratorViewModelBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$shouldAutoStartAtom = Atom(
      name: '_VoiceGeneratorViewModelBase.shouldAutoStart', context: context);

  @override
  bool get shouldAutoStart {
    _$shouldAutoStartAtom.reportRead();
    return super.shouldAutoStart;
  }

  @override
  set shouldAutoStart(bool value) {
    _$shouldAutoStartAtom.reportWrite(value, super.shouldAutoStart, () {
      super.shouldAutoStart = value;
    });
  }

  late final _$loadAudioAsyncAction =
      AsyncAction('_VoiceGeneratorViewModelBase.loadAudio', context: context);

  @override
  Future<void> loadAudio() {
    return _$loadAudioAsyncAction.run(() => super.loadAudio());
  }

  late final _$startAudioAsyncAction =
      AsyncAction('_VoiceGeneratorViewModelBase.startAudio', context: context);

  @override
  Future<void> startAudio() {
    return _$startAudioAsyncAction.run(() => super.startAudio());
  }

  late final _$_VoiceGeneratorViewModelBaseActionController =
      ActionController(name: '_VoiceGeneratorViewModelBase', context: context);

  @override
  void initAudioPlayer() {
    final _$actionInfo = _$_VoiceGeneratorViewModelBaseActionController
        .startAction(name: '_VoiceGeneratorViewModelBase.initAudioPlayer');
    try {
      return super.initAudioPlayer();
    } finally {
      _$_VoiceGeneratorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seekForward() {
    final _$actionInfo = _$_VoiceGeneratorViewModelBaseActionController
        .startAction(name: '_VoiceGeneratorViewModelBase.seekForward');
    try {
      return super.seekForward();
    } finally {
      _$_VoiceGeneratorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seekBackward() {
    final _$actionInfo = _$_VoiceGeneratorViewModelBaseActionController
        .startAction(name: '_VoiceGeneratorViewModelBase.seekBackward');
    try {
      return super.seekBackward();
    } finally {
      _$_VoiceGeneratorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSliderValue(double value) {
    final _$actionInfo = _$_VoiceGeneratorViewModelBaseActionController
        .startAction(name: '_VoiceGeneratorViewModelBase.updateSliderValue');
    try {
      return super.updateSliderValue(value);
    } finally {
      _$_VoiceGeneratorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sliderValue: ${sliderValue},
maxValue: ${maxValue},
isPlaying: ${isPlaying},
shouldAutoStart: ${shouldAutoStart}
    ''';
  }
}
