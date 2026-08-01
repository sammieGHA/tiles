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
	public function new()
	{
		super();

		var tiles = new Tiles(stage.stageWidth, stage.stageHeight);
		addChild(tiles);
		tiles.regenerate();

		var fps = new FPS(10, 10);
		addChild(fps);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, (e: KeyboardEvent) -> {
			if (e.keyCode == Keyboard.SPACE)
				tiles.regenerate();
		});
	}
}
