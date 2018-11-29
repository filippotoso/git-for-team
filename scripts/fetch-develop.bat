@ECHO OFF

ECHO Checking out the develop branch
git checkout develop

ECHO Remote fetching
git fetch origin develop

ECHO Checking out read-only remote develop branch
git checkout origin/develop

IF "%1"=="" GOTO End

ECHO Creating and checking out the "%1" branch to work on the changes
git checkout -b "%1"

:End

ECHO Done!