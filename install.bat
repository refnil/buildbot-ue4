@echo off
@setlocal enableextensions
@cd /d "%~dp0"

call config.cmd
echo %INSTALLDIR%

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if NOT %errorLevel% == 0 (
	echo Failure: Current permissions inadequate.
	pause
	goto :EOF
) 

echo We will begin the installation of python 2.7 on your machine
echo !!!WARNING!!! Make sure to add python to your path during the installation
pause

%installdir%\python-2.7.9.amd64.msi
%installdir%\pywin32-219.win-amd64-py2.7.exe
%installdir%\Twisted-14.0.2.win-amd64-py2.7.msi
%installdir%\VCForPython27.msi

python %installdir%\ez_setup.py
%easy_install% zope.interface
%easy_install% Jinja2
%easy_install% PyOpenSSL
%easy_install% sqlite3

powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%installdir%\buildbot-0.8.10.zip', '.'); }"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%installdir%\buildbot-slave-0.8.10.zip', '.'); }"

cd buildbot-0.8.10
python setup.py install
cd ..
cd buildbot-slave-0.8.10
python setup.py install
cd ..

pause
:EOF