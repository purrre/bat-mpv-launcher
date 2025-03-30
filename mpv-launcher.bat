@echo off

set "MPV_PATH=" :: Path to the mpv exe
set "MUSIC_DIR=" :: Path to the folder with your music. will scramble ALL contents inside, so be specific.
set "PLAYLIST=%TEMP%\playlist.m3u" :: Path to the temporary playlist. i recommend leaving this

echo Start mpv with tracks? :: add the artist name if you want
pause

:: Create playlist, Edit the file extensions supported if you want
> "%PLAYLIST%" (
    for /r "%MUSIC_DIR%" %%F in (*.mp3 *.wav *.flac *.ogg) do (
        echo %%F
    )
)

start "" "%MPV_PATH%" --shuffle --playlist="%PLAYLIST%"
exit
