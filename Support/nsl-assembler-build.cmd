@echo off

set nsis_path=

if defined NSIS_HOME (
    if exist "%NSIS_HOME%\makensis.exe" (
        set "nsis_path=%NSIS_HOME%"
        goto build
    )
)

if %PROCESSOR_ARCHITECTURE%==x86 (
    set RegQry=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
) else (
    set RegQry=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
)

if not defined nsis_path (
    for /F "tokens=2*" %%a in ('reg query "%RegQry%" /v InstallLocation ^|findstr InstallLocation') do set nsis_path=%%b
)

if not defined nsis_path (
    for %%X in (makensis.exe) do (set nsis_path=%%~dp$PATH:X)
)

set args=
:loop
    set args=%args% %1
    shift
if not "%~2"=="" goto loop

:build
if defined nsis_path (
    java.exe -jar "%nsis_path%\NSL\nsL.jar" /nomake /nopause %args%
) else (
    echo "Error: Make sure Java is in your PATH environmental variable and nsL Assembler is installed"
)
