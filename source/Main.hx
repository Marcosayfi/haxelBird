package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.events.Event;

class Main extends Sprite
{
	public function new()
	{
		super();
		if (stage != null) init(null);
		else addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		#if (mobile || html5)
		stage.scaleMode = StageScaleMode.EXACT_FIT;
		stage.align = StageAlign.TOP_LEFT;
		#end

		addChild(new FlxGame(1280, 720, PlayState));
	}
}
