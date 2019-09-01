import 'dart:html';

import 'package:AudioLib/AudioLib.dart';
import 'package:CommonLib/Logging.dart';
import 'package:CommonLib/Utility.dart';
import 'package:LoaderLib/Loader.dart';
import 'package:TextEngine/TextEngine.dart';
import 'scripts/AudioPlayer.dart';
import 'scripts/InputHandler.dart';
import 'scripts/TextDisplayer.dart';
import 'package:recase/recase.dart';


String chatHandle = "";
Element output = querySelector("#output");
bool breakTime = false;
bool lunchTime = false;
Future<void> main() async {
  new Audio();
  final AudioChannel channelVoice = Audio.createChannel("Voice", 1.0); // 0.5
  final AudioChannel channelMusic = Audio.createChannel("Music", 0.3); // 0.5

  output.append(TextDisplayer.inputDisplay);
  output.append(TextDisplayer.butlerResponse);
  await setChatHandle();
  TextDisplayer.display(output);
  output.append(AudioPlayer.playButton());
  butlerPrint("Observer, do not forget to check: http://farragofiction.com:8500/ChatLogHax should you wish extra knowledge.");
  InputHandler.handle(chatHandle);
  checkStatus();
}


Future<void> setChatHandle() async {
  TextEngine textEngine = new TextEngine();
  await textEngine.loadList("chatHandleShitposts");
  chatHandle = "${textEngine.phrase("firstWord")}${new ReCase(textEngine.phrase("secondWord")).sentenceCase} ".replaceAll(" ","");
}

Future<void> checkStatus() async {
  butlerPrint("Awaiting input.");
  checkBreak();
  await HttpRequest.getString("http://farragofiction.com:8500/ResponseStatus").then((String response) {
    butlerPrint(response);
    TextDisplayer.display(output);
    AudioPlayer.play();
    checkStatus();
  });
}

void checkBreak() async {
  await checkBreakTime();
  await checkLunchTime();
  checkIfChangeImage();
}

Future<void> checkBreakTime() async {
  await HttpRequest.getString("http://farragofiction.com:8500/BreakTime").then((String response) {
    //change image to sign if not null
    if(response != "null" && !breakTime) {
      breakTime = true;
      AudioPlayer.playHoldMusic();
    }else if(response == "null") {
      if(breakTime) {
        AudioPlayer.stopHoldMusic();

      }
      breakTime = false;
    }
  });
}

Future<void> checkLunchTime() async {
  await HttpRequest.getString("http://farragofiction.com:8500/LunchTime").then((String response) {
    //change image to sign if not null also load music
    if(response != "null" && !lunchTime) {
      lunchTime = true;
      AudioPlayer.playHoldMusic();
    }else if(response == "null") {
      if(lunchTime) {
        AudioPlayer.stopHoldMusic();
      }
      lunchTime = false;
    }
  });
}

void checkIfChangeImage() {
  if(lunchTime) {
    changeImage("LUNCH_TIME.png");
  }else if(breakTime) {
    changeImage("On_Break.png");
  }else {
    changeImage("ButlerBot.png");
  }
}

void changeImage(String newSource) {
  querySelector("body").style.backgroundImage = "url($newSource)";
  querySelector("html").style.backgroundImage = "url($newSource)";

}

void butlerPrint(String text, [int size = 18]) {
  const String fontFamiily = "'Cabin', Courier, monospace";
  const String fontWeight = "bold";
  const String fontColor = "#000000";
  final String consortCss = "font-family: $fontFamiily;color:$fontColor;font-size: ${size}px;font-weight: $fontWeight;";
    fancyPrint("BB: $text",consortCss);
}