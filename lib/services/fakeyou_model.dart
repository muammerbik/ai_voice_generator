import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FakeYouModel {
  bool? success;
  String? inference_job_token;
  String? inference_job_token_type;
  FakeYouModel({
    this.success,
    this.inference_job_token,
    this.inference_job_token_type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'inferenceJobToken': inference_job_token,
      'inferenceJobTokenType': inference_job_token_type,
    };
  }

  factory FakeYouModel.fromMap(Map<String, dynamic> map) {
    return FakeYouModel(
      success: map['success'] != null ? map['success'] as bool : null,
      inference_job_token: map['inference_job_token'] != null
          ? map['inference_job_token'] as String
          : null,
      inference_job_token_type: map['inference_job_token_type'] != null
          ? map['inference_job_token_type'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FakeYouModel.fromJson(String source) =>
      FakeYouModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FakeYouModel(success: $success, inferenceJobToken: $inference_job_token, inferenceJobTokenType: $inference_job_token_type)';
}
