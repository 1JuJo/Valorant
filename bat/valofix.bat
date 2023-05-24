@echo off
set "Riotfolder=C:\Riot Games"
if exist "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\ja_JP_Text-WindowsClient.pak" (
    copy "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\ja_JP_Text-WindowsClient.pak" "%~dp0..\jp\old\ja_JP_Text-WindowsClient.pak"
    copy "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\ja_JP_Text-WindowsClient.sig" "%~dp0..\jp\old\ja_JP_Text-WindowsClient.sig"
) else (
    if exist "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\en_US_Text-WindowsClient.pak" (
        copy "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\en_US_Text-WindowsClient.pak" "%~dp0..\jp\new\ja_JP_Text-WindowsClient.pak"
        copy "%Riotfolder%\VALORANT\live\ShooterGame\Content\Paks\en_US_Text-WindowsClient.sig" "%~dp0..\jp\new\ja_JP_Text-WindowsClient.sig"
    ) 
)
