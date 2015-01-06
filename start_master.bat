@echo off
@setlocal enableextensions
@cd /d "%~dp0"

call config.cmd

IF NOT EXIST master (
%buildbot% create-master master
copy  master.cfg.default master\master.cfg
) ELSE (
%buildbot% --verbose restart master 
)