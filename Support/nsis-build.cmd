@echo off

rem Check %PATH% for makensis.exe
for %%X in (makensis.exe) do (set nsis_path=%%~dp$PATH:X)
if defined nsis_path goto :found

rem Check registry for NSIS install path
if %PROCESSOR_ARCHITECTURE%==x86 (
    set RegQry=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
) else (
    set RegQry=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
)

for /F "tokens=2*" %%a in ('reg query "%RegQry%" /v InstallLocation ^|findstr InstallLocation') do set nsis_path=%%b 

:found
set args=
:loop
    set args=%args% %1
    shift
if not "%~1"=="" goto loop

if defined nsis_path (
    "%nsis_path%\makensis.exe" %args%
) else (
    echo 'makensis.exe' is not recognized as an internal or external command, operable program or batch file.
)
