@echo off
color 0a
cd ..
@echo on
echo Installing dependencies.
haxelib install hxpkg
haxelib run hxpkg install
echo Finished!
pause
