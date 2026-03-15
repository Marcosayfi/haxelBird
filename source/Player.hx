package;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{
    static inline var SPEED_X:Float = 100;
    static inline var FLAP_Y:Float = -200;
    static inline var GRAVITY:Float = 400;

    public function new(x:Float = 50, y:Float = 200)
    {
        super(x, y);

	    loadGraphic("assets/images/duckie.png"); // bird

        acceleration.y = GRAVITY; // gravity
        maxVelocity.y = 300;
    }

    override function update(elapsed:Float)
    {
        // move to the right
        velocity.x = SPEED_X;

        // flap
        if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.UP)
        {
            velocity.y = FLAP_Y;
        }


        super.update(elapsed);

        // stop at top
        if (y < 0)
        {
            y = 0;
            velocity.y = 0;
        }

        // stop at bottom
        if (y + height > FlxG.height)
        {
            y = FlxG.height - height;
            velocity.y = 0;
        }
    }
}