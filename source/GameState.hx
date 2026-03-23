package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class GameState extends FlxState
{
	var player:Player;
    var bg = new FlxSprite(0, 0);
    var pipe = new FlxSprite(0, -768);

	override public function create()
	{
	    bg.loadGraphic("assets/images/gameplay/gameBG.png");
        add(bg);
		player = new Player(20, 20);
        add(player);
		pipe.loadGraphic("assets/images/gameplay/pipe.png");
		super.create();
		trace ('pressed play button'); // traces that you pressed play button
	}

	override public function update(elapsed:Float)
	{
		FlxG.random.int(100, 200);
	    if (FlxG.random.bool(150)) {
			add(pipe);
        } 
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(PlayState.new);
		}
	 	super.update(elapsed);
	}
}
