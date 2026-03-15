package;

import flixel.FlxState;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var playButton = new FlxSprite(0, 0);
    var bg = new FlxSprite(0, 0);  // stuff

	override public function create()
	{
		super.create();
		trace ('opened the game'); // traces that you opened the game, OMG who could've thought?!?
        playButton.makeGraphic(100, 100, FlxColor.GREEN);
        add(playButton);
	    bg.loadGraphic("assets/images/bg.png");
        add(bg);

	}


	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
