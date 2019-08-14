import 'dart:html';

import 'package:CommonLib/Utility.dart';
import 'package:LoaderLib/Loader.dart';

abstract class TextDisplayer {
    static DivElement inputDisplay = new DivElement()..id = "inputDisplay";
    static DivElement butlerResponse = new DivElement()..id = "butlerResponse";

    static Future<void> display(Element output) async{
        final dynamic jsonRet = await Loader.getResource(
            "http://farragnarok.com/PodCasts/hello_butler_bot.json");
        print("json ret is $jsonRet");
        final JsonHandler json = new JsonHandler(jsonRet);
        print("json is $json");
        inputDisplay.setInnerHtml(json.getValue("summary"));

        butlerResponse.setInnerHtml(json.getValue("transcript"));
    }



}