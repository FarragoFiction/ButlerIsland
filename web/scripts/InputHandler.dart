import 'dart:html';

abstract class InputHandler {
    static TextAreaElement textAreaElement = new TextAreaElement()..id = "inputElement"..text = "What is going on here?";

    static void handle(String chatHandle) {
        final Element inputContainer = querySelector("#input");
        final DivElement instructions = new DivElement()..text = "Say something to ButlerBot! Anyone listening will be able to see what you said and hear what ButlerBot has to say back to you."..id = "instructions";
        final LabelElement label = new LabelElement()..text = "You are '$chatHandle':";

        final ButtonElement button = new ButtonElement()..text = "Talk to BB";


        inputContainer.append(instructions);
        inputContainer.append(label);
        inputContainer.append(textAreaElement);
        inputContainer.append(button);


    }

}