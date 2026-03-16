package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;

class SettingsState extends FlxState
{
    // variables
    var closeButton:FlxButton;

    override public function create():Void
    {
        super.create();
        trace('opened settings'); // traces that you opened the game, OMG who could've thought?!?

        closeButton = new FlxButton(1160, 0, "", closeSettings);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        var wip = new flixel.text.FlxText(0, 0, 0, "WIP", 64);
        wip.screenCenter;
        add(wip);
    }

    function clickPlay():Void
    {
        FlxG.switchState(PlayState.new);
    }

    function closeSettings():Void
    {
        FlxG.switchState(PlayState.new);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}