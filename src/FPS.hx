package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.events.Event;
import openfl.Lib;

class FPS extends Sprite {
    var textField: TextField;
    var frameCount: Int = 0;
    var last: Float = 0;

    public function new(x: Float = 10, y: Float = 10) {
        super();

        this.x = x; this.y = y;

        textField = new TextField();
        textField.autoSize = LEFT;
        textField.selectable = false;
        textField.mouseEnabled = false;

        var formatttttttttttttttt = new TextFormat("pirkkala", 16, 0xffffff);
        textField.defaultTextFormat = formatttttttttttttttt;
        textField.embedFonts = true;

        textField.text = "FPS: 0";

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
            textField.text = 'FPS: $fps';

            frameCount = 0;
            last = curTime;
        }
    }
}