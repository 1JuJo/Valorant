@echo off
setlocal enabledelayedexpansion
set "old_folder=%~dp0\old"
set "new_folder=%~dp0\new"
for /r "%old_folder%" %%a in (*) do (
    set "old_file=%%~nxa"
)
for /r "%new_folder%" %%b in (*) do (
    ren "%%b" "!old_file!"
)