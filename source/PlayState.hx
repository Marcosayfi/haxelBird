package;

import flixel.text.FlxText;
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
    var skinsButton:FlxButton;
    var achievementsMenu:FlxButton;
    var html5Notice = new flixel.text.FlxText(900, 387, 0, "notice: you're on html5", 20);
    var flashNotice = new flixel.text.FlxText(900, 387, 0, "notice: you're on flash", 20);
 
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

        skinsButton = new FlxButton(100, 400, "", openSkins);
        skinsButton.loadGraphic("assets/images/menu/skinButton.png"); // add buttons
        add(skinsButton);

        closeButton = new FlxButton(1160, 0, "", closeGame);
        closeButton.loadGraphic("assets/images/menu/closeButton.png");
        add(closeButton);

        achievementsMenu = new FlxButton(956, 151, "", openAchievementsMenu);
        achievementsMenu.loadGraphic("assets/images/menu/achievementButton.png");
        add(achievementsMenu);
    }

    function clickPlay():Void
    {
        FlxG.switchState(() -> new GameState());
    }

    function closeGame():Void
    {
        #if (!html5 && !flash)
        trace('bai bai');
        Sys.exit(0); // remove this line when compiling to html5 so i don't have to remove this line every time i compile to them
        #end
        #if html5
        add(html5Notice);
        #end
        #if flash
        add(flashNotice);
        #end
    }

    function openSkins():Void
    {
        FlxG.switchState(() -> new SkinsState());
    }

    function openAchievementsMenu():Void
    {
        FlxG.switchState(() -> new AchievementsState());
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        #if (!mobile && !html5 && !flash)
        if (FlxG.keys.justPressed.ESCAPE)
        {
          trace('bai bai');
          Sys.exit(0); // ditto as last comment
        }
        #end


        #if (html5 || flash)
        if (FlxG.keys.justPressed.ESCAPE)
        {
          trace('bai bai');
          add(html5Notice);
        }
        #end

        if (FlxG.sound.music == null) // song
        {
	       FlxG.sound.playMusic(AssetPaths.mainMenu__ogg, 1, true);
        }

        #if !android
        if (FlxG.mouse.justPressed)
        {
           trace("Clicked at: " + FlxG.mouse.x + ", " + FlxG.mouse.y);
        }

        #end
    }
}