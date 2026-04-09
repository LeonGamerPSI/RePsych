package states;

import objects.Character;
import flixel.addons.transition.FlxTransitionableState;

class TitleState extends MusicBeatState
{
	public static var updateVersion:String = '';

	var gf:Character = new Character(0, 0, 'bf', true);
	var enter:FlxSprite;

	override function beatHit()
	{
		super.beatHit();
		if (!c)
			gf.dance();
		Conductor.bpm = 102;
		FlxG.camera.zoom = 1.1;
	}

	override function create()
	{
		super.create();
		gf.screenCenter();
		gf.active = false;
		add(gf);
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.8);
		persistentDraw = persistentUpdate = true;
        
		enter = new FlxSprite(0, 0);
		enter.frames = Paths.getSparrowAtlas('titleEnter');
		enter.animation.addByPrefix('idle', 'ENTER IDLE', 24);
		enter.animation.addByPrefix('press', 'ENTER PRESSED', 24);
		enter.animation.play('idle');
		enter.screenCenter();
		enter.x += 200;
		enter.y = FlxG.height - enter.height - 75;
		add(enter);
	}

	var c = false;

	override function update(elapsed:Float)
	{
		FlxG.camera.zoom = FlxMath.lerp(FlxG.camera.zoom, 1.0, elapsed * 2);
		Conductor.songPosition = FlxG.sound.music.time;
		if (controls.ACCEPT)
		{
			c = true;
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.8);
			FlxG.camera.flash(0xffffffff, 0.5);
			gf.specialAnim = true;
			gf.playAnim('hey');
			gf.heyTimer = 22;
			enter.animation.play('press');
			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				MusicBeatState.switchState(new MainMenuState());
			});
		}
		@:privateAccess
		gf.updateAnimation(elapsed);
		super.update(elapsed);
	}
}
