package;

import haxe.Json;
import sys.FileSystem;
import sys.io.File;

typedef Library = {
	name:String, type:String,
	version:String, dir:String,
	ref:String, url:String
}

class Main {
	public static function main():Void {
		// Create a folder to prevent messing with hmm libraries
		if (!FileSystem.exists(".haxelib"))
			FileSystem.createDirectory(".haxelib");



		Sys.command('haxelib',['install','hxpkg']);
		Sys.command('haxelib',['run','hxpkg','install']);
				

		// after the loop, we can leave
		Sys.exit(0);
	}
}
