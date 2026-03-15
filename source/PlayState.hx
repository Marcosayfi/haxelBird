package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
    var bg:FlxSprite;  // variables
    var logo:FlxSprite;
    var playButton:FlxButton;
    var closeButton:FlxButton;

    override public function create():Void
    {
        super.create();
        trace('opened the game'); // traces that you opened the game, OMG who could've thought?!?

        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/menu/menuBG.png");
        add(bg);

        logo = new FlxSprite(200, 200);
        logo.loadGraphic("assets/images/menu/logo.png");
        add(logo);

        playButton = new FlxButton(750, 500, "", clickPlay);
        playButton.loadGraphic("assets/images/menu/playButton.png"); // add buttons
        add(playButton);

        closeButton = new FlxButton(1160, 0, "", closeGame);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);
    }

    function clickPlay():Void
    {
        FlxG.switchState(GameState.new);
    }

    function closeGame():Void
    {
        trace('bai bai');
        Sys.exit(0);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}