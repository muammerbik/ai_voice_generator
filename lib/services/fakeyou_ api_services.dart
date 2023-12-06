import 'dart:convert';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/services/fakeyou_get_model.dart';
import 'package:ai_voice_generator/services/fakeyou_model.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class FakeyouApiServices {
  final String baseUrl = "https://api.fakeyou.com/tts/inference";
  final String getBaseUrl = "https://api.fakeyou.com/tts/job/";

  Future<String> sendTokenToApi(String tokenText, String tokenModel) async {
    Uuid uuid = Uuid();
    String result = 'a';

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "uuid_idempotency_token": uuid.v4(),
          "tts_model_token": tokenModel,
          "inference_text": tokenText,
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
      fakeyouModelll model = fakeyouModelll.fromJson(response.body);
      String ttfPath = "";

      while (true) {
        await Future.delayed(Duration(milliseconds: 150));

        final response2 = await http.get(
          Uri.parse('$getBaseUrl${model.inference_job_token}'),
        );

        if (response2.statusCode == 200) {
          print(response2.body);
          VoiceModel model2 = VoiceModel.fromJson(response2.body);

          if (model2.state.status == "complete_success") {
            ttfPath = model2.state.maybePublicBucketWavAudioPath!;
            break;
          }
        }
      }
      tokenModel = "https://storage.googleapis.com/vocodes-public$ttfPath";

      tokenUrl = tokenModel;

      return tokenModel;
    } else {}

    return result;
  }
}
