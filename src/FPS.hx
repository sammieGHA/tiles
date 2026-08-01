package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.events.Event;
import openfl.Lib;

import openfl.system.System;

/**
 * the fps counter that go
 * fps:
 * mem:
 */
class FPS extends Sprite {
    var background: Sprite;
    var textField: TextField;
    var frameCount: Int = 0;
    var last: Float = 0;

    var padding: Float = 6;

    public function new(x: Float = 10, y: Float = 10) {
        super();

        this.x = x; this.y = y;

        background = new Sprite();
        addChild(background);

        textField = new TextField();
        textField.autoSize = LEFT;
        textField.selectable = false;
        textField.mouseEnabled = false;

        var formatttttttttttttttt = new TextFormat("pirkkala", 16, 0xffffff);
        textField.defaultTextFormat = formatttttttttttttttt;
        textField.embedFonts = true;

        textField.x = padding;
        textField.y = padding;

        textField.text = "FPS: ...\nMEM: ...";

        addChild(textField);

        last = Lib.getTimer();
        addEventListener(Event.ENTER_FRAME, enterFrame);
    }

    function enterFrame(e: Event) {
        frameCount++;

        var curTime = Lib.getTimer();
        var elapsed = curTime - last;

        if (elapsed >= 500) {
            var fps = Math.round(frameCount / (elapsed / 1000));
            var mem = Math.round(System.totalMemory / 1024 / 1024);

            updateText('FPS: $fps\nMEM: $mem MB');

            frameCount = 0;
            last = curTime;
        }
    }

    function updateText(text: String) {
        textField.text = text;

        var w = textField.width + padding * 2;
        var h = textField.height + padding * 2;

        background.graphics.clear();
        background.graphics.beginFill(0x000000, .5);
        background.graphics.drawRect(0, 0, w, h);
        background.graphics.endFill();
    }
}