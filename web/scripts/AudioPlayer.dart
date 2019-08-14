import 'package:AudioLib/AudioLib.dart';

abstract class AudioPlayer{

    static void play() async{
        await Audio.play("http://farragnarok.com/PodCasts/hello_butler_bot", "Voice");

    }
}