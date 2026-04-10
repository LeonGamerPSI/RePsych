package backend.plugins;

import flixel.FlxBasic;
import flixel.addons.plugin.screengrab.FlxScreenGrab;

class ReloadPlugin extends FlxBasic
{
	public function new()
	{
		super();
		FlxG.plugins.addPlugin(this);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.F5)
		{
			FlxG.signals.preStateCreate.addOnce((s) -> Paths.clearStoredMemory());
			FlxG.resetState();
		}
	}
}
