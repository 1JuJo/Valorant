@echo off
setlocal enabledelayedexpansion
set "riotPath="
set "driveLetters=C D E F G H I J K L M N O P Q R S T U V W X Y Z"
for %%D in (%driveLetters%) do (
    if exist "%%D:\Riot Games\" (
        set "riotPath=%%D:\Riot Games"
        goto :found_folder
    )
)
:read_last_path
set "batchDir=%~dp0files"
set "pathFile=%~dp0\files\path.txt"
if exist "%pathFile%" (
    set /p "riotPath=" < "%pathFile%"
    goto :checks
)
:ask_for_path
set /p "riotPath=Enter the path to Riot Games folder: "
:checks
if not defined riotPath (
    echo Riot Games folder path not provided.
    goto :ask_for_path
)
if not exist "%riotPath%" (
    echo Invalid path.
    goto :ask_for_path
)
if not "%riotPath:~-10%"=="Riot Games" (
    echo Invalid path. The folder name should end with "Riot Games".
    goto :ask_for_path
)
if not exist "%riotPath%\VALORANT" (
    echo The path you provided is invalid.
    echo You probably sent the path of Valorant's shortcut. What you need to send is the path to Valorant's game folder, or root if you prefer. 

    goto :ask_for_path
)
:found_folder
echo %riotPath%> "%pathFile%"
copy /y "%~dp0\files\jp\old\*.*" "%riotPath%\VALORANT\live\ShooterGame\Content\Paks"
copy /y "%~dp0\wallpaper\old\*.*" "%riotPath%\VALORANT\live\ShooterGame\Content\Movies\Menu"
start "" "%riotPath%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"
:start
tasklist /fi "imagename eq Valorant.exe" 2>NUL | find /i /n "Valorant.exe" >NUL
if "%ERRORLEVEL%"=="0" goto :copy_files
goto :start
:copy_files
copy /y "%~dp0\files\jp\new\*.*" "%riotPath%\VALORANT\live\ShooterGame\Content\Paks"
copy /y "%~dp0\wallpaper\new\*.*" "%riotPath%\VALORANT\live\ShooterGame\Content\Movies\Menu"