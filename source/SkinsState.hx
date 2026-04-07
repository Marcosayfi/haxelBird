package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxSave;
import flixel.util.FlxColor;

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
    var bg:FlxSprite;
    var skinsText:FlxText;

    override public function create():Void
    {
        super.create();
        trace('opened settings'); // traces that you opened the settings

        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/menu/skins/background.png");
        bg.scale.set(2, 2);
        add(bg);

        closeButton = new FlxButton(1160, 0, "", closeSettings);
        closeButton.loadGraphic("assets/images/menu/closeButton.png"); // add buttons
        add(closeButton);

        normalduckieButton = new FlxButton(78, 393, "", setNormalDuckie);
        normalduckieButton.loadGraphic("assets/images/menu/skins/duckieButton.png"); // skin buttons
        add(normalduckieButton);

        highqualityduckieButton = new FlxButton(678, 393, "", increaseDuckieQuality);
        highqualityduckieButton.loadGraphic("assets/images/menu/skins/highQualityDuckButton.png");
        add(highqualityduckieButton);

        devilangelduckButton = new FlxButton(1078, 393, "", setDevilAngelDuckie);
        devilangelduckButton.loadGraphic("assets/images/menu/skins/devilangelDuckButton.png");
        add(devilangelduckButton);

        otherduckieButton = new FlxButton(278, 393, "", setOtherDuckie);
        otherduckieButton.loadGraphic("assets/images/menu/skins/otherDuckieButton.png");
        add(otherduckieButton);

        zombieDuckButton = new FlxButton(878, 393, "", setZombieDuckie);
        zombieDuckButton.loadGraphic("assets/images/menu/skins/zombieDuckButton.png");
        add(zombieDuckButton);

        creeperduckButton = new FlxButton(478, 393, "", setCreeperDuckie);
        creeperduckButton.loadGraphic("assets/images/menu/skins/creeperDuckieButton.png");
        add(creeperduckButton);

        skinsText = new FlxText(460, 200, 0, "Skins", 32, true);
        skinsText.setFormat("assets/comic-sans.ttf", 64, FlxColor.BLACK, CENTER);
        add(skinsText);
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