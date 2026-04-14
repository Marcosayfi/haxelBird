package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class GameState extends FlxState
{
	var player:Player;
    var bg:FlxSprite;
	public var pipes:FlxGroup;
	var spawnTimer:Float = 0;
	var spawnRate:Float = 4; // seconds between pipes
	var jumpButton:FlxButton;
	var closeButton:FlxButton;
	var matches:Bool = false;
	var scored:Array<Bool> = [];
	var scores:Int = 0;
	var scoreText:FlxText;
	public var highScore:Int = 0;
	var isDead:Bool = false;

	override public function create()
	{
		super.create();

		// high score
		HighScores.initialize();
		highScore = HighScores.getHighScore();

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
		#end

		closeButton = new FlxButton(1160, 0, "", pauseGame);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);
        

		scoreText = new FlxText(940, 50, 0, "Score:" + scores, 32);
		scoreText.setFormat("assets/comic-sans.ttf", 32, FlxColor.BLACK);
		add(scoreText);

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
		    openSubState(new PauseMenuSubState());
		}
		#end

	    for (i in 0...Std.int(pipes.members.length / 2)) {
		var topPipe = cast(pipes.members[i * 2], FlxSprite);
		var bottomPipe = cast(pipes.members[i * 2 + 1], FlxSprite);
		if (!scored[i] && player.y > topPipe.y + topPipe.height && player.y < bottomPipe.y) {
			trace("add score");
			scored[i] = true;
			scores +=1;
			scoreText.text = "Score:" + scores;
		}
	}

	FlxG.overlap(player, pipes, onOverlap, function(obj1, obj2) {
		// This callback returns true if pixels overlap, preventing 
		// the callback 'onOverlap' from running if they don't.
		   return FlxG.pixelPerfectOverlap(cast obj1, cast obj2);
		});

		super.update(elapsed);
	}

	function onOverlap(obj1:FlxSprite, obj2:FlxSprite):Void {
	   if (!isDead)
	    {
	   	   isDead = true;
	       var isNewHighScore = HighScores.addScore(scores);
	       highScore = HighScores.getHighScore();
           FlxG.switchState(DeathState.new);
        }
    }

	public function jumpPlayer()
	{
		player.jumpFunction();
	}

	function pauseGame():Void
    {
        openSubState(new PauseMenuSubState());
    }

	//  pipe
	function spawnPipe()
	{
		var gapY = FlxG.random.int(100, 400);
		var gapSize = 150;

		// TOP PIPE
		var topPipe = new FlxSprite(FlxG.width, 0);
		topPipe.loadGraphic("assets/images/gameplay/pipe but upside down.png");
		topPipe.y = gapY - topPipe.height;
		topPipe.velocity.x = -100;

		// BOTTOM PIPE
		var bottomPipe = new FlxSprite(FlxG.width, 0);
		bottomPipe.loadGraphic("assets/images/gameplay/pipe.png");
		bottomPipe.y = gapY + gapSize;
		bottomPipe.velocity.x = -100;

		pipes.add(topPipe);
		pipes.add(bottomPipe);
		scored.push(false);
	}
}