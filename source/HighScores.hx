package;

import flixel.util.FlxSave;

class HighScores
{
	private static var save:FlxSave;
	private static var SAVE_KEY:String = "haxelbird";
	private static var MAX_SCORES:Int = 10;
	public static var scores:Array<Int> = [];

	public static function initialize():Void
	{
		if (save == null)
		{
			save = new FlxSave();
			save.bind(SAVE_KEY);
			loadScores();
		}
	}

	public static function loadScores():Void
	{
		// Load existing scores from save or start with empty array
		if (save.data.scores != null)
		{
			scores = save.data.scores;
		}
		else
		{
			scores = [];
		}
	}

	public static function addScore(score:Int):Bool
	{
		// Check if it's a new high score
		var isHighScore = false;
		
		if (scores.length == 0 || score > scores[0])
		{
			isHighScore = true;
		}

		// Add score to the array
		scores.push(score);
		
		// Sort in descending order
		scores.sort((a, b) -> b - a);
		
		// Keep only top MAX_SCORES
		if (scores.length > MAX_SCORES)
		{
			scores = scores.slice(0, MAX_SCORES);
		}

		// Save to file
		save.data.scores = scores;
		save.flush();

		return isHighScore;
	}

	public static function getHighScore():Int
	{
		if (scores.length > 0)
		{
			return scores[0];
		}
		return 0;
	}

	public static function getScores():Array<Int>
	{
		return scores.copy();
	}

	public static function getAllScores():String
	{
		if (scores.length == 0)
		{
			return "No high scores yet!";
		}

		var output = "HIGH SCORES:\n";
		for (i in 0...scores.length)
		{
			output += (i + 1) + ". " + scores[i] + "\n";
		}
		return output;
	}
}
