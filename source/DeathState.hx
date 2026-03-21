package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;

class DeathState extends FlxState
{
    // variables
    var closeButton:FlxButton;

    override public function create():Void
    {
        super.create();
        trace('died'); // self explanitory unless you don't understand english

        closeButton = new FlxButton(1160, 0, "", closeDeathScreen);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        var wip = new flixel.text.FlxText(0, 0, 0, "WIP", 64);
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