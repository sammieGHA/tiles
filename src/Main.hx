package;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.display.Tile;
import openfl.Assets;
import openfl.geom.Rectangle;

class Main extends Sprite
{
	public function new()
	{
		super();

		trace("Testing testing..");

		var bm = Assets.getBitmapData('res/tiles.png');
		var tileset = new Tileset(bm);

		for (i in 0...4) {
			tileset.addRect(new Rectangle(i * 64, 0, 64, 64));
		}

		var tilemap = new Tilemap(stage.stageWidth, stage.stageHeight, tileset);
		addChild(tilemap);

		var cols = Math.ceil(stage.stageWidth / 64);
		var rows = Math.ceil(stage.stageHeight / 64);

		for (row in 0...rows) {
			for (column in 0...cols) {
				var tileID = Std.random(4);
				var tile = new Tile(tileID, column * 64, row * 64);
				tilemap.addTile(tile);
			}
		}
	}
}
