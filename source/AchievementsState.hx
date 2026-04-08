package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;

class AchievementsState extends FlxState
{
    var closeButton:FlxButton;
    var wipText:FlxText;

    override public function create():Void
    {
        super.create();
        closeButton = new FlxButton(1160, 0, "", closeAchievementsMenu);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        wipText = new FlxText(0, 0, 0, "WIP", 32);
        wipText.screenCenter(XY);
        add(wipText);
    }

    function closeAchievementsMenu():Void
    {
        FlxG.switchState(PlayState.new);
    }

    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        #if !mobile
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(PlayState.new);
		}
		#end
    }
}