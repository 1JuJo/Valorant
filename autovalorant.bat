@echo off
set "valo=C:\Riot Games"

copy /y "%~dp0\jp\old\*.*" "%valo%\VALORANT\live\ShooterGame\Content\Paks"
copy /y "%~dp0\wallpaper\old\*.*" "%valo%\VALORANT\live\ShooterGame\Content\Movies\Menu"

start "" "%valo%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"

:start

tasklist /fi "imagename eq Valorant.exe" 2>NUL | find /i /n "Valorant.exe" >NUL
if "%ERRORLEVEL%"=="0" goto :copy_files

goto :start

:copy_files
copy /y "%~dp0\jp\new\*.*" "%valo%\VALORANT\live\ShooterGame\Content\Paks"
copy /y "%~dp0\wallpaper\new\*.*" "%valo%\VALORANT\live\ShooterGame\Content\Movies\Menu"
