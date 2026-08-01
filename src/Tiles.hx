package;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.display.Tile;
import openfl.Assets;
import openfl.geom.Rectangle;

/**
 * the tiles in the background thatr are not haxeflixel colors george. . . . . 
 */
class Tiles extends Sprite
{
    var tilemap: Tilemap;
    var cols: Int;
    var rows: Int;

	public function new(width: Int, height: Int)
	{
		super();

		var bm = Assets.getBitmapData('res/tiles.png');
		var tileset = new Tileset(bm);

		for (i in 0...4) {
			tileset.addRect(new Rectangle(i * 64, 0, 64, 64));
		}

		tilemap = new Tilemap(width, height, tileset);

		cols = Math.ceil(width / 64);
		rows = Math.ceil(height / 64);

        addChild(tilemap);
        regenerate();
	}

    public function regenerate() {
        tilemap.removeTiles();

		for (row in 0...rows) {
			for (column in 0...cols) {
				var tileID = Std.random(4);
				var tile = new Tile(tileID, column * 64, row * 64);
				tilemap.addTile(tile);
			}
		}
    }
}
