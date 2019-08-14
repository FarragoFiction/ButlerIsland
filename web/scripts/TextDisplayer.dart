import 'dart:html';

import 'package:CommonLib/Utility.dart';
import 'package:LoaderLib/Loader.dart';

abstract class TextDisplayer {
    static DivElement inputDisplay = new DivElement()..id = "inputDisplay";
    static DivElement butlerResponse = new DivElement()..id = "butlerResponse";

    static Future<void> display(Element output) async{
        String url = "http://farragnarok.com/PodCasts/hello_butler_bot.json";
        Loader.purgeResource(url);
        final dynamic jsonRet = await Loader.getResource(url);
        final JsonHandler json = new JsonHandler(jsonRet);
        inputDisplay.setInnerHtml(json.getValue("summary"));

        butlerResponse.setInnerHtml("BB: ${json.getValue("transcript")}");
    }



}