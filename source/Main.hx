package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.events.Event;
import hxdiscord_rpc.Discord;
import hxdiscord_rpc.Types;
import sys.thread.Thread;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		// Initialize Discord RPC in background thread
		Thread.create(function():Void
		{
			Sys.println('Initializing Discord RPC...');

			final handlers:DiscordEventHandlers = new DiscordEventHandlers();
			handlers.ready = cpp.Function.fromStaticFunction(onReady);
			handlers.disconnected = cpp.Function.fromStaticFunction(onDisconnected);
			handlers.errored = cpp.Function.fromStaticFunction(onError);
			Discord.Initialize("345229890980937739", cpp.RawPointer.addressOf(handlers), false, null); // TODO: make a custom id

			while (true)
			{
				#if DISCORD_DISABLE_IO_THREAD
				Discord.UpdateConnection();
				#end

				Discord.RunCallbacks();

				Sys.sleep(2);
			}
		});

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

	private static function onReady(request:cpp.RawConstPointer<DiscordUser>):Void
	{
		final username:String = request[0].username;
		final globalName:String = request[0].username;
		final discriminator:Int = Std.parseInt(request[0].discriminator);

		if (discriminator != 0)
			Sys.println('Discord: Connected to user ${username}#${discriminator} ($globalName)');
		else
			Sys.println('Discord: Connected to user @${username} ($globalName)');

		final discordPresence:DiscordRichPresence = new DiscordRichPresence();
		discordPresence.type = DiscordActivityType_Watching;
		discordPresence.state = "gaming";
		discordPresence.details = "Haxel Bird";
		discordPresence.largeImageKey = "assets/images/gameplay/duckie.png"; //not working yet
		discordPresence.smallImageKey = "ptb-small";

		final button:DiscordButton = new DiscordButton();
		button.label = "Test 1";
		button.url = "https://example.com";
		discordPresence.buttons[0] = button;

		final button:DiscordButton = new DiscordButton();
		button.label = "Test 2";
		button.url = "https://discord.gg/fortnite";
		discordPresence.buttons[1] = button;

		Discord.UpdatePresence(cpp.RawConstPointer.addressOf(discordPresence));
	}

	private static function onDisconnected(errorCode:Int, message:cpp.ConstCharStar):Void
	{
		Sys.println('Discord: Disconnected ($errorCode:$message)');
	}

	private static function onError(errorCode:Int, message:cpp.ConstCharStar):Void
	{
		Sys.println('Discord: Error ($errorCode:$message)');
	}
}

