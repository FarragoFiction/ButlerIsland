import 'dart:html';
import 'dart:web_audio';

import 'package:AudioLib/AudioLib.dart';
import 'package:LoaderLib/Loader.dart';

abstract class AudioPlayer{

    static AudioBufferSourceNode music;

    static void play() async{
        final String url = "http://farragnarok.com/PodCasts/hello_butler_bot";
        Loader.purgeResource("$url.mp3");
        Loader.purgeResource("$url.ogg");

        await Audio.play(url, "Voice");

    }

    static Future<void> playHoldMusic() async {
        music = await Audio.play("http://farragnarok.com/PodCasts/Please_Hold_V2", "Music");
    }

    static void stopHoldMusic() {
        if(music != null) music.stop();
    }

    static ButtonElement playButton() {
        final ButtonElement button = new ButtonElement()..text = "RePlay Audio";
        button.onClick.listen((MouseEvent e) {
            play();
        });
        return button;

    }
}