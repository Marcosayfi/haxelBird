package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;

class AchievementsState extends FlxTransitionableState
{
    var closeButton:FlxButton;
    var highScoresText:FlxText;
    var titleText:FlxText;

    override public function create():Void
    {
        super.create();
        closeButton = new FlxButton(1160, 0, "", closeAchievementsMenu);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 0.2);
        FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.2);

        // high scores system
        HighScores.initialize();

        titleText = new FlxText(0, 50, 0, "YOUR HIGH SCORE", 48);
        titleText.screenCenter(X);
        titleText.setFormat("assets/comic-sans.ttf", 48);
        add(titleText);

        // actually show the high score
        var highScore = HighScores.getHighScore();
        highScoresText = new FlxText(0, 200, 0, Std.string(highScore), 96);
        highScoresText.screenCenter(X);
        highScoresText.setFormat("assets/comic-sans.ttf", 96);
        add(highScoresText);
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