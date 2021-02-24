# C:\Users\jimh\Language\git.cmd
@echo off
setlocal
set MyName=%~nx0
for %%f in (*) do (
	if exist "%%f" (
		@rem
	) else (
		echo Fail:%MyName%: %%f does NOT exist. Will goto :eof
		goto :eof
	)
	if exist "%%f\null" (
		@rem echo %%f is a Directory
	) else (
		call :Git "%%f"
	)
)
goto :eof
:Git
setlocal
set Name_0=%~1
set /a Count=0
:loop
set Name_1=%Count%_%Name_0%
set Path_0=Git\%Name_1%
if exist "%Path_0%" (
	C:\Windows\System32\fc.exe "%Name_0%" "%Path_0%" >nul && (
		goto :eof
	) || (
		set /a Count+=1
		goto :loop
	)
) else (
	if exist Git (
		@rem echo "Git exists"
	) else (
		mkdir Git
	)
	copy "%Name_0%" "%Path_0%"
)
