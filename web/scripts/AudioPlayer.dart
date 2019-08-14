import 'dart:html';

import 'package:AudioLib/AudioLib.dart';
import 'package:LoaderLib/Loader.dart';

abstract class AudioPlayer{

    static void play() async{
        final String url = "http://farragnarok.com/PodCasts/hello_butler_bot";
        Loader.purgeResource("$url.mp3");
        Loader.purgeResource("$url.ogg");

        await Audio.play(url, "Voice");

    }

    static ButtonElement playButton() {
        final ButtonElement button = new ButtonElement()..text = "RePlay Audio";
        button.onClick.listen((MouseEvent e) {
            play();
        });
        return button;

    }
}