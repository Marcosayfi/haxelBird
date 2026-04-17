import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class PauseMenuSubState extends FlxSubState {
    public function new(bgColor:FlxColor = 0x66000000) {
        super(bgColor);
    }

    override public function create():Void {
        super.create();
        
        // ui
        var text = new FlxText(0, 0, 0, "pause menu", 20);
        text.screenCenter();
        add(text);

        var closeButton = new FlxButton(0, 0, "resume", () -> close());
        closeButton.screenCenter();
        closeButton.y += 40;
        add(closeButton);

        var mainMenuButton = new FlxButton(0, 0, "main menu", openMainMenu);
        mainMenuButton.screenCenter();
        mainMenuButton.y += 80;
        add(mainMenuButton);
    }

    function openMainMenu():Void
    {
        FlxG.switchState(PlayState.new);
    }
}