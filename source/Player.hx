package;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{
  static inline var SPEED_X:Float = -160;
  static inline var FLAP_Y:Float = -200;
  static inline var GRAVITY:Float = 400;
  public var skin:String;

  public function new(x:Float = 50, y:Float = 200)
  {
    super(x, y);

    // load saved skin from FlxSave
    var save = new flixel.util.FlxSave();
    if (save.bind("haxelbird") && save.data.playerSkin != null)
    {
     skin = save.data.playerSkin;
     save.flush();
    }
    else
    {
      skin = "normal"; // default
      save.flush();
    }

    {
      loadGraphic("assets/images/gameplay/skins/" + skin + ".png"); // load the skin depending on what you have selected
    }

    acceleration.y = GRAVITY;
    maxVelocity.y = 300;
  }

    override function update(elapsed:Float)
    {
     #if !mobile
     // flap
     if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W || FlxG.mouse.justPressed)
      {
        jumpFunction();
      }
     #end

     super.update(elapsed);
      // stop at top
      if (y < -87)
      {
        FlxG.switchState(DeathState.new);
      }

      // stop at bottom
      if (y + height > FlxG.height)
        {
           y = FlxG.height - height;
        }
    }

    public function jumpFunction()
    {
      velocity.y = FLAP_Y;
    }
}