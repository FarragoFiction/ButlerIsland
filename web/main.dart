import 'dart:html';

import 'package:AudioLib/AudioLib.dart';
import 'package:CommonLib/Utility.dart';
import 'package:LoaderLib/Loader.dart';

import 'scripts/AudioPlayer.dart';
import 'scripts/TextDisplayer.dart';

Element output = querySelector("#output");
Future<void> main() async {
  new Audio();
  final AudioChannel channelVoice = Audio.createChannel("Voice", 1.0); // 0.5
  output.append(TextDisplayer.inputDisplay);
  output.append(TextDisplayer.butlerResponse);
  TextDisplayer.display(output);
  AudioPlayer.play();
}

