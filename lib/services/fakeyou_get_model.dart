import 'dart:convert';

class VoiceModel {
  final bool success;
  final VoiceState state;

  VoiceModel({required this.success, required this.state});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'state': state.toMap(),
    };
  }

  factory VoiceModel.fromMap(Map<String, dynamic> map) {
    return VoiceModel(
      success: map['success'] as bool,
      state: VoiceState.fromMap(map['state'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VoiceModel.fromJson(String source) => VoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class VoiceState {
  String? jobToken;
  String? status;
  int? attemptCount;
  String? maybeResultToken;
  String? maybePublicBucketWavAudioPath;
  String? modelToken;
  String? ttsModelType;
  String? title;
  String? rawInferenceText;
  String? createdAt;
  String? updatedAt;

  VoiceState({
    required this.jobToken,
    required this.status,
    required this.attemptCount,
    required this.maybeResultToken,
    required this.maybePublicBucketWavAudioPath,
    required this.modelToken,
    required this.ttsModelType,
    required this.title,
    required this.rawInferenceText,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'job_token': jobToken,
      'status': status,
      'attempt_count': attemptCount,
      'maybe_result_token': maybeResultToken,
      'maybe_public_bucket_wav_audio_path': maybePublicBucketWavAudioPath,
      'model_token': modelToken,
      'tts_model_type': ttsModelType,
      'title': title,
      'raw_inference_text': rawInferenceText,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory VoiceState.fromMap(Map<String, dynamic> map) {
    return VoiceState(
      jobToken: map['job_token'] != null ? map['job_token'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      attemptCount: map['attempt_count'] != null ? map['attempt_count'] as int : null,
      maybeResultToken: map['maybe_result_token'] != null ? map['maybe_result_token'] as String : null,
      maybePublicBucketWavAudioPath: map['maybe_public_bucket_wav_audio_path'] != null
          ? map['maybe_public_bucket_wav_audio_path'] as String
          : null,
      modelToken: map['model_token'] != null ? map['model_token'] as String : null,
      ttsModelType: map['tts_model_type'] != null ? map['tts_model_type'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      rawInferenceText: map['raw_inference_text'] != null ? map['raw_inference_text'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoiceState.fromJson(String source) => VoiceState.fromMap(json.decode(source) as Map<String, dynamic>);
}