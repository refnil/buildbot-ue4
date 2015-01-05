@echo off
@setlocal enableextensions
@cd /d "%~dp0"

call config.cmd

IF EXIST master (
taskkill /im python.exe /F
%buildbot% stop master 
)