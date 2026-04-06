package;

import flixel.ui.FlxButton;
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
	var spawnRate:Float = 3.5; // seconds between pipes
	var jumpButton:FlxButton;
	var closeButton:FlxButton;

	override public function create()
	{
		super.create();

	    bg = new FlxSprite(0, 0);
	    bg.loadGraphic("assets/images/gameplay/gameBG.png");
        add(bg);

		player = new Player(200, 200);
        add(player);

		pipes = new FlxGroup();
		add(pipes);

		#if mobile
		jumpButton = new FlxButton(1000, 475, "", jumpPlayer);
		jumpButton.loadGraphic("assets/images/gameplay/jump.png");
		add(jumpButton);

		closeButton = new FlxButton(1160, 0, "", openMainMenu);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);
        #end

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
		#if !mobile
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(PlayState.new);
		}
		#end

	

		FlxG.overlap(player, pipes, onOverlap, function(obj1, obj2) {
        // This callback returns true if pixels overlap, preventing 
        // the callback 'onOverlap' from running if they don't.
           return FlxG.pixelPerfectOverlap(cast obj1, cast obj2);
        });

		super.update(elapsed);
	}

	function onOverlap(obj1:FlxSprite, obj2:FlxSprite):Void {
       FlxG.switchState(DeathState.new);
    }

	public function jumpPlayer()
	{
		player.jumpFunction();
	}

	function openMainMenu():Void
    {
        FlxG.switchState(PlayState.new);
    }

	//  pipe
	function spawnPipe()
	{
		var gapY = FlxG.random.int(200, FlxG.height - 200);

		// TOP PIPE
		var topPipe = new FlxSprite(FlxG.width, gapY - 450);
		topPipe.loadGraphic("assets/images/gameplay/pipe but upside down.png");
		topPipe.velocity.x = -100;

		// BOTTOM PIPE
		var bottomPipe = new FlxSprite(FlxG.width, gapY + 150);
		bottomPipe.loadGraphic("assets/images/gameplay/pipe.png");
		bottomPipe.velocity.x = -100;

		pipes.add(topPipe);
		pipes.add(bottomPipe);
	}
}