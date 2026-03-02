import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:webview_flutter/webview_flutter.dart';

class TranslateController extends GetxController {
  late stt.SpeechToText speech;
  var isListening = false.obs;
  var confidence = 1.0.obs;

  final textController = TextEditingController();

  var isPlaying = false.obs;
  var cameraEnabled = true.obs;
  var currentAnimation = "".obs;
  var speedValue = 0.0.obs;

  WebViewController? webViewController;

  final animations = {"انا": "Iam", "الان": "ActionNow", "مرحبا": ""};

  @override
  void onInit() {
    super.onInit();
    speech = stt.SpeechToText();
    textController.addListener(_onTextChanged);
  }

  @override
  void onClose() {
    textController.dispose();
    speech.stop();
    super.onClose();
  }

  void _onTextChanged() {
    if (animations.containsKey(textController.text)) {
      currentAnimation.value = animations[textController.text]!;
      setAnimation(currentAnimation.value);
    }
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speech.initialize();
      if (available) {
        isListening.value = true;
        speech.listen(
          onResult: (result) {
            textController.text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              confidence.value = result.confidence;
            }
          },
        );
      }
    } else {
      isListening.value = false;
      speech.stop();
    }
  }

  void togglePlay() {
    isPlaying.value = !isPlaying.value;
  }

  void toggleCamera() {
    cameraEnabled.value = !cameraEnabled.value;
  }

  void increaseSpeed() {
    speedValue.value += 0.5;
  }

  void decreaseSpeed() {
    speedValue.value -= 0.5;
  }

  void setWebViewController(WebViewController controller) {
    webViewController = controller;
    Future.delayed(const Duration(milliseconds: 300), () {
      setAnimation(currentAnimation.value);
    });
  }

  void setAnimation(String name) {
    if (webViewController == null) return;

    webViewController!.runJavaScript("""
      const mv = document.querySelector('#model-viewer');
      mv.animationName = "$name";
      mv.play();
    """);
  }
}
