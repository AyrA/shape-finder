@ECHO OFF
SETLOCAL
SET DEST=%APPTATA%\shapez.io\mods
PUSHD "%~dp0"
CHOICE /C:YN /M "Install shape finder mod"
IF ERRORLEVEL 2 GOTO END

MD "%DEST%"
COPY findshape.js "%DEST%" /Y
ECHO Mod installed.
ECHO You have to restart the game for the changes to become effective.
PAUSE
GOTO END

:END
POPD
