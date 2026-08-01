package;

import openfl.ui.Keyboard;
import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.display.Tile;
import openfl.Assets;
import openfl.geom.Rectangle;

import openfl.events.KeyboardEvent;

class Main extends Sprite
{
	var logos:Array<Logo> = [];

	public function new()
	{
		super();

		var tiles = new Tiles(stage.stageWidth, stage.stageHeight);
		addChild(tiles);
		tiles.regenerate();

        for (i in 0...5) {
            var logo = new Logo(Std.random(15) * 64, Std.random(15) * 64, stage.stageWidth, stage.stageHeight);
            addChild(logo);
            logos.push(logo);
        }

		var fps = new FPS(10, 10);
		addChild(fps);

		/**
		 * space: regernerate tiles in bakcogrund
		 * 
		 * z: make logos go slower
		 * x: make logo go faster (infinite)
		 */
		stage.addEventListener(KeyboardEvent.KEY_DOWN, (e: KeyboardEvent) -> {
			if (e.keyCode == Keyboard.SPACE)
				tiles.regenerate();
			for (logo in logos) {
				if (e.keyCode == Keyboard.Z)
					if (logo.speed > .1) logo.speed -= .1;
				if (e.keyCode == Keyboard.X)
					logo.speed += .1;
			}
		});
	}
}
