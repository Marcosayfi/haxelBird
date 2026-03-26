package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;

class GameState extends FlxState
{
	var player:Player;
    var bg:FlxSprite;

	var pipes:FlxGroup;
	var spawnTimer:Float = 0;
	var spawnRate:Float = 2; // seconds between pipes

	override public function create()
	{
		super.create();

	    bg = new FlxSprite(0, 0);
	    bg.loadGraphic("assets/images/gameplay/gameBG.png");
        add(bg);

		player = new Player(20, 200);
        add(player);

		pipes = new FlxGroup();
		add(pipes);

		trace('pressed play button'); // traces that you pressed play button
	}

	override public function update(elapsed:Float)
	{
		// spawn timer
		spawnTimer += elapsed;

		if (spawnTimer >= spawnRate)
		{
			spawnPipe();
			spawnTimer = 0;
		}

		// ESC to go back
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(PlayState.new);
		}

		super.update(elapsed);
	}

	//  pipe
	function spawnPipe()
	{
		var gapY = FlxG.random.int(100, FlxG.height - 100);

		// TOP PIPE
		var topPipe = new FlxSprite(FlxG.width, gapY - 400);
		topPipe.loadGraphic("assets/images/gameplay/pipe but upside down.png");
		topPipe.velocity.x = -100;

		// BOTTOM PIPE
		var bottomPipe = new FlxSprite(FlxG.width, gapY + 100);
		bottomPipe.loadGraphic("assets/images/gameplay/pipe.png");
		bottomPipe.velocity.x = -100;

		pipes.add(topPipe);
		pipes.add(bottomPipe);
	}
}