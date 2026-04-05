package;

import flixel.util.FlxColor;
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
        
        bg = new FlxSprite(0, 0);
        bg.makeGraphic(1280, 720, FlxColor.RED);
        add(bg);

        retry = new FlxButton(600, 350, "retry", retryGame);
        
        var wip = new flixel.text.FlxText(0, 0, 0, "you dead (wip)", 64);
        wip.screenCenter;
        add(wip);
        add(closeButton);
        retry = new FlxButton(600, 350, "retry", retryGame);
        add(retry);
    }

    function closeDeathScreen():Void
    {
        FlxG.switchState(PlayState.new);
    }

    function retryGame():Void
    {
        FlxG.switchState(GameState.new);
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
			FlxG.switchState(PlayState.new);
		}
		#end
    }
}