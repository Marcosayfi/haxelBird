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

        playButton = new FlxButton(0, 0, "", clickPlay);
        playButton.loadGraphic("assets/images/menu/playButton.png"); // guessing game
        playButton.label.setFormat(null, 25, 0xffff4800, "center");
        playButton.scale.set(7, 10);
        playButton.updateHitbox();
        add(playButton);

        closeButton = new FlxButton(0, 0, "", closeGame);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttpns
        add(closeButton);
    }

    function clickPlay():Void
    {
        FlxG.switchState(GameState.new);
    }

    function closeGame():Void
    {
        trace('bai bai');
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}