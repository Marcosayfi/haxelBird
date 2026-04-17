package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxSprite;

class DeathState extends FlxState
{
    // variables
    var closeButton:FlxButton;
    var bg:FlxSprite;
    var retry:FlxButton;

    override public function create():Void
    {
        super.create();
        trace('died'); // self explanitory unless you don't understand english

        closeButton = new FlxButton(1160, 0, "", closeDeathScreen);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        
        bg = new FlxSprite(100, 0);
        bg.loadGraphic("assets/images/menu/death/backgrond.png");
        bg.scale.set(1.7, 1.3);
        add(bg);

        retry = new FlxButton(600, 350, "", retryGame);
        retry.loadGraphic("assets/images/menu/death/retry.png");
        retry.scale.set(0.33, 0.3);
        
        add(closeButton);
        add(retry);
    }

    function closeDeathScreen():Void
    {
        FlxG.switchState(PlayState.new);
    }

    function retryGame():Void
    {
        FlxG.switchState(() -> new GameState());
    }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        #if !mobile
        if (FlxG.mouse.justPressed)
        {
           trace("Clicked at: " + FlxG.mouse.x + ", " + FlxG.mouse.y);
        }
        
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(() -> new GameState());
		}
		#end
    }
}