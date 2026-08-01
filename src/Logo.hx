package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.Event;

/**
 * the logo that goes around the screen and goes lalala
 */
class Logo extends Sprite {
    static inline var TILE_SIZE: Int = 64;
    public var speed: Float = 2;

    var bm: Bitmap;
    var gridWidth: Int;
    var gridHeight: Int;

    var targetX: Float;
    var targetY: Float;

    var dirX: Int = 0;
    var dirY :Int = 0;

    public function new(x: Float, y: Float, gridWidth: Int, gridHeight: Int) {
        super();

        this.x = x; this.y = y; this.gridWidth = gridWidth; this.gridHeight = gridHeight;

        bm = new Bitmap(Assets.getBitmapData('res/OpenFL.png'));
        addChild(bm);

        targetX = x;
        targetY = y;

        pickadaNew();
        addEventListener(Event.ENTER_FRAME, enterFrame);

    }

    function pickadaNew() {
        var directions = [
            {x: 1, y: 0},
            {x: -1, y :0},
            {x: 0, y:1},
            {x: 0, y : -1}
        ];

        var validDirections = [];

        for (dir in directions) {
            var nextX = targetX + dir.x * TILE_SIZE;
            var nextY = targetY + dir.y * TILE_SIZE;

            if (nextX >= 0 && nextX<=gridWidth-TILE_SIZE&&nextY>=0&&nextY<=gridHeight-TILE_SIZE) {
                validDirections.push(dir);
            }
        }

        if (validDirections.length > 0) {
            var chosen = validDirections[Std.random(validDirections.length)];
            dirX = chosen.x;
            dirY = chosen.y;

            targetX += dirX * TILE_SIZE;
            targetY += dirY * TILE_SIZE;
        }
    }

    function enterFrame(e: Event) {
        x += dirX * speed;
        y += dirY * speed;

        var rx = (dirX == 0) || (dirX > 0 && x>= targetX) || (dirX <0 && x <= targetX);
        var ry = (dirY == 0)|| (dirY > 0 && y >= targetY) || (dirY < 0 &&y <= targetY);

        if (ry && rx) {
            x = targetX; y = targetY;
            pickadaNew();
        }
    }
}