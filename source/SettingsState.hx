package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxSave;

class SettingsState extends FlxState
{
    // variables
    var closeButton:FlxButton;
    var normalduckieButton:FlxButton;
    var otherduckieButton:FlxButton;
    var playerSkin:Player;
    var wip = new flixel.text.FlxText(0, 0, 0, "WIP", 64);

    override public function create():Void
    {
        super.create();
        trace('opened settings'); // traces that you opened the settings

        closeButton = new FlxButton(1160, 0, "", closeSettings);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        normalduckieButton = new FlxButton(50, 100, "", setNormalDuckie);
        normalduckieButton.loadGraphic("assets/images/gamemplay/duckie.png");
        add(normalduckieButton);

        otherduckieButton = new FlxButton(50, 200, "", setOtherDuckie);
        otherduckieButton.loadGraphic("assets/images/gamemplay/otherDuckieButton.png");
        add(otherduckieButton);

        add(wip);
    }

    function closeSettings():Void
    {
        FlxG.switchState(PlayState.new);
    }

    function setNormalDuckie():Void
    {
        Settings.playerSkin = "normal";
        saveSkin();
    }

    function setOtherDuckie():Void
    {
        Settings.playerSkin = "other";
        saveSkin();
    }
    function saveSkin():Void
    {
     var save = new flixel.util.FlxSave();
     if (save.bind("haxelbird"))
        {
           save.data.playerSkin = Settings.playerSkin;
           save.flush(); // now the folder and file are created
        }
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}