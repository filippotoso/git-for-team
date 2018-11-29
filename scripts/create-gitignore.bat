@ECHO OFF

IF "%1"=="" GOTO CurrentDir

SET "FILE=%1\.gitignore"
GOTO Execute

:CurrentDir

SET "FILE=%CD%\.gitignore"
GOTO Execute

:Execute

type nul > "%FILE%"

ECHO Done!