package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class GameState extends FlxState
{
	var player:Player;
    var bg = new FlxSprite(0, 0);

	override public function create()
	{
	    bg.loadGraphic("assets/images/gameplay/gameBG.png");
        add(bg);
		player = new Player(20, 20);
        add(player);
		super.create();
		trace ('pressed play button'); // traces that you pressed play button
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(PlayState.new);
		}
	}
}
