::Sloan's batch script for refreshing nm tickets on SAS4 Steam

::I suggest watching my youtube videos for the manual process of steam ticket reset prior to using this script
::You will need version files for both 1.10.2 and the current version of SAS (2.0.1)
::You must run this script as administrator in order to change the date through cmd, everything else will work fine through normal cmd

@echo off

::change directory to where SAS is opened up from, should be the same for all windows PCs
cd C:\Program Files (x86)\Steam\steamapps\common\SAS Zombie Assault 4

::assumes you already have SAS open, but will still execute regardless and not cause problems
taskkill /im SAS4-Win.exe

::makes sure SAS is closed before changing version files
TIMEOUT 3

::Copies version 1.10.2 files and pastes them in game directory
::You will need to change the first directory structure to wherever you have version 1.10.2 stored, everything else can remain the same
Xcopy "C:\Users\llslo\OneDrive\Desktop\Misc\games\Misc files\SAS\sas version change\1-10-2" "C:\Program Files (x86)\Steam\steamapps\common\SAS Zombie Assault 4" /s /e /y /q 

::opens SAS from directory on line 10
start SAS4-Win.exe

::Have to be on MP screen when changing date
echo.
echo Go to multiplayer screen

::Makes you press any key to continue once you are in MP screen
pause

::Calls subroutine to make dates for today as well as next year
CALL :date-change

::Change date one or more days forward
date %newDate%

::Must force backup to keep refreshed tickets
echo.
echo Force backup
pause

::Closes out of 1.10.2
taskkill /im SAS4-Win.exe

::Same 3 second break as above
TIMEOUT 3

::Copies current version files and pastes them in game directory
::You will need to change the first directory structure to wherever you have cxurrent version stored, everything else can remain the same
Xcopy "C:\Users\llslo\OneDrive\Desktop\Misc\games\Misc files\SAS\sas version change\2-0-1" "C:\Program Files (x86)\Steam\steamapps\common\SAS Zombie Assault 4" /s /e /y /q

::Change date back before returning to current version
date %currentDate%

::Starts current version
start SAS4-Win.exe
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Subroutine for date change

:date-change
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
)
:s_done

:: Pad digits with leading zeros
      Set _yyyy=%_yyyy:~-2%
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%

:: Display the date/time in ISO 8601 format:
Set currentDate=%_mm%-%_dd%-%_yyyy%
Set /a nextDate=%_dd%+1
Set newDate=%_mm%-%nextDate%-%_yyyy%
