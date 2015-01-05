@echo off
@setlocal enableextensions
@cd /d "%~dp0"

call config.cmd

if "%1"=="" (
    echo You need to have an argument
    goto :eof
)

set account=%1
set pass=%1
set folder-name=slave-%1

IF not EXIST %folder-name% (
echo create-slave %folder-name% %ip%:%port% %account% %pass%
%slave% create-slave %folder-name% %ip%:%port% %account% %pass%
GOTO :NEXT
)
:NEXT
%slave% start %folder-name%

:EOF