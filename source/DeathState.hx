package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxSprite;

class DeathState extends FlxState
{
    // variables
    var closeButton:FlxButton;
    var bg:FlxSprite;

    override public function create():Void
    {
        super.create();
        trace('died'); // self explanitory unless you don't understand english

        closeButton = new FlxButton(1160, 0, "", closeDeathScreen);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        bg = new FlxSprite(0, 0);
        bg.makeGraphic(1280, 720, FlxColor.RED);
        add(bg);

        var wip = new flixel.text.FlxText(0, 0, 0, "you dead (wip)", 64);
        wip.screenCenter;
        add(wip);
    }

    function closeDeathScreen():Void
    {
        FlxG.switchState(PlayState.new);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}