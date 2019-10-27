@echo off  
set "src=C:\source\In"
set "dest=C:\dest\Out"
 for %%F in ("%src%\*.*") do (
    for /f "tokens=1,2,3 delims=/ " %%A in ("%%~tF") do (
        if not exist "%dest%\%%A" mkdir "%dest%\%%A"
            forfiles -p "%src%" -d -2 -m *.* /C "cmd /c move "%%~fF" "%dest%\%%A"" 
    )
 )