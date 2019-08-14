import 'dart:html';

import 'package:http/http.dart';

abstract class InputHandler {
    static TextAreaElement textAreaElement = new TextAreaElement()..id = "inputElement"..text = "What is going on here?";
    static DivElement statusElement = new DivElement()..id = "status";
    static void handle(String chatHandle) {
        final Element inputContainer = querySelector("#input");
        inputContainer.append(statusElement);
        final DivElement instructions = new DivElement()..text = "Say something to ButlerBot! Anyone listening will be able to see what you said and hear what ButlerBot has to say back to you."..id = "instructions";
        final LabelElement label = new LabelElement()..text = "You are '$chatHandle':";

        final ButtonElement button = new ButtonElement()..text = "Talk to BB";
        button.onClick.listen((Event e) => submitInput(chatHandle));


        inputContainer.append(instructions);
        inputContainer.append(label);
        inputContainer.append(textAreaElement);
        inputContainer.append(button);
    }

    static Future<void> submitInput(String chatHandle) async {
        final Response resp =   await get("http://farragofiction.com:8500/TalkButlerBot?chatHandle=$chatHandle&input=${textAreaElement.value}");
        statusElement.text = resp.body;
    }

}