@ECHO OFF
SETLOCAL
SET DEST=%APPTATA%\shapez.io\mods
PUSHD "%~dp0"
IF NOT EXIST findshape.js GOTO NOFILE
CHOICE /C:YN /M "Install shape finder mod"
IF ERRORLEVEL 2 GOTO END
GOTO INSTALL

:NOFILE
ECHO Cannot find "%CD%\findshape.js"
PAUSE
GOTO END

:INSTALL
MD "%DEST%"
COPY findshape.js "%DEST%" /Y
ECHO Mod installed.
ECHO You have to restart the game for the changes to become effective.
PAUSE
GOTO END

:END
POPD
