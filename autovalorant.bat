@echo off

for %%D in ( C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\Riot Games\" (
        set "valo=%%D:\Riot Games"
        goto :found_folder
    )
)

echo Riot Games folder not found.
pause
exit

:found_folder
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
