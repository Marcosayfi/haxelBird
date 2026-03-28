package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
    var bg:FlxSprite;  // variables
    var logo:FlxSprite;
    var playButton:FlxButton;
    var closeButton:FlxButton;
    var settingsButton:FlxButton;
    var html5Notice = new flixel.text.FlxText(900, 387, 0, "notice: you're on html", 20);
 
    override public function create():Void
    {
        super.create();
        trace('opened the game'); // traces that you opened the game, OMG who could've thought?!?

        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/menu/menuBG.png"); 
        add(bg);
        // adding the sprites is just almost just pure english idk if it's bc i suck at coding
        logo = new FlxSprite(200, 200);
        logo.loadGraphic("assets/images/menu/logo.png");
        add(logo);

        playButton = new FlxButton(750, 500, "", clickPlay);
        playButton.loadGraphic("assets/images/menu/playButton.png"); // add buttons
        add(playButton);

        settingsButton = new FlxButton(500, 500, "Settings", openSettings);
        add(settingsButton);

        closeButton = new FlxButton(1160, 0, "", closeGame);
        closeButton.loadGraphic("assets/images/menu/closeButton.png");
        add(closeButton);
        
    }

    function clickPlay():Void
    {
        FlxG.switchState(GameState.new);
    }

    function closeGame():Void
    {
        #if !html5
        trace('bai bai');
        Sys.exit(0); // remove this line when compiling to https or similar so i don't have to remove this line every time i compile to them
        #end
        #if html5
        add(html5Notice);
        #end
    }

    function openSettings():Void
    {
        FlxG.switchState(SettingsState.new);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if (FlxG.keys.justPressed.ESCAPE)
        {
          #if !html5
          trace('bai bai');
          Sys.exit(0); // ditto as last comment
          #end
          #if html5
          add(html5Notice);
          #end
        }

        if (FlxG.sound.music == null) // don't restart the music if it's already playing
        {
	       FlxG.sound.playMusic(AssetPaths.mainMenu__ogg, 1, true);
        }
    }
}