package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxSave;

class SkinsState extends FlxState
{
    // variables
    var closeButton:FlxButton;
    var normalduckieButton:FlxButton;
    var otherduckieButton:FlxButton;
    var highqualityduckieButton:FlxButton;
    var creeperduckButton:FlxButton;
    var devilangelduckButton:FlxButton;
    var zombieDuckButton:FlxButton;
    var playerSkin:Player;
    var wip = new flixel.text.FlxText(592, 298, 0, "WIP", 64);

    override public function create():Void
    {
        super.create();
        trace('opened settings'); // traces that you opened the settings

        closeButton = new FlxButton(1160, 0, "", closeSettings);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        normalduckieButton = new FlxButton(494, 393, "Normal Duckie", setNormalDuckie);
        normalduckieButton.loadGraphic("assets/images/menu/duckieButton.png"); // these are just placeholders for now
        add(normalduckieButton);

        highqualityduckieButton = new FlxButton(394, 393, "high quality", increaseDuckieQuality);
        highqualityduckieButton.loadGraphic("assets/images/menu/duckieButton.png"); // these are just placeholders for now
        add(highqualityduckieButton);

        devilangelduckButton = new FlxButton(791, 393, "DevilAngel", setDevilAngelDuckie);
        devilangelduckButton.loadGraphic("assets/images/menu/otherDuckieButton.png");
        add(devilangelduckButton);

        otherduckieButton = new FlxButton(580, 393, "Fancy Duckie", setOtherDuckie);
        otherduckieButton.loadGraphic("assets/images/menu/otherDuckieButton.png");
        add(otherduckieButton);

        zombieDuckButton = new FlxButton(680, 393, "Zombie Duckie", setZombieDuckie);
        zombieDuckButton.loadGraphic("assets/images/menu/otherDuckieButton.png");
        add(zombieDuckButton);

        creeperduckButton = new FlxButton(891, 393, "creeper Duckie", setZombieDuckie);
        creeperduckButton.loadGraphic("assets/images/menu/otherDuckieButton.png");
        add(creeperduckButton);

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

    function setZombieDuckie():Void
    {
        Settings.playerSkin = "zombie";
        saveSkin();
    }

    function setDevilAngelDuckie():Void
    {
        Settings.playerSkin = "devilangel";
        saveSkin();
    }

    function setCreeperDuckie():Void
    {
        Settings.playerSkin = "creeper";
        saveSkin();
    }

    function increaseDuckieQuality():Void
    {
        Settings.playerSkin = "extremeQuality";
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
        #if !mobile
        if (FlxG.mouse.justPressed)
        {
           trace("Clicked at: " + FlxG.mouse.x + ", " + FlxG.mouse.y);
        }
        #end
    }
}