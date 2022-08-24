@ECHO OFF
SETLOCAL
PUSHD "%~dp0"
REM We need that name quite often
SET OUT=findshape.zip
REM Check for custom environment and use that
IF NOT "%ZIP%"=="" GOTO CUSTOM

REM Try to find 7-zip in various locations
SET ZIP=%ProgramFiles%\7-zip\7z.exe
IF NOT EXIST "%ZIP%" SET ZIP=%ProgramFiles(x86)%\7-zip\7z.exe
IF NOT EXIST "%ZIP%" SET ZIP=%CD%\7-zip\7z.exe
IF NOT EXIST "%ZIP%" GOTO NOZIP
GOTO BUILD

REM Create zip archive
:BUILD
IF EXIST "%OUT%" DEL "%OUT%"
IF EXIST "%OUT%" GOTO INUSE
"%ZIP%" a "%OUT%" findshape.js LICENSE README.md install.bat
REM This outdated syntax means 1 or bigger
IF ERRORLEVEL 1 GOTO FAIL
IF NOT EXIST "%OUT%" GOTO FAIL
GOTO END

REM Zip archive creation failed
:FAIL
ECHO Failed to create "%OUT%" using "%ZIP%".
ECHO - Ensure that your 7-zip installation works
ECHO - Ensure you can write to "%CD%"
GOTO END

REM Cannot delete existing files
:INUSE
ECHO Unable to delete "%OUT%" from "%CD%".
ECHO - Ensure the file is not in use
ECHO - Ensure you have delete permissions in "%CD%"
ECHO - Ensure your anti virus is not interfering
GOTO END

REM Sanity check for custom ZIP variable
:CUSTOM
IF EXIST "%ZIP%" GOTO BUILD
ECHO ZIP variable is set but it does not point to an executable.
ECHO Potential fixes:
ECHO - Unset the variable to use the auto-detect feature
ECHO - Set the variable to an existing copy of 7z.exe
GOTO NOZIP

REM 7-zip executable not found
:NOZIP
ECHO 7-zip could not be found
GOTO END

REM End of script
:END
POPD
PAUSE
