@ECHO OFF

ECHO Checking out the master branch
git checkout master

ECHO Remote fetching
git fetch origin master

ECHO Checking out read-only remote master branch
git checkout origin/master

IF "%1"=="" GOTO End

ECHO Creating and checking out the "%1" branch to work on the changes
git checkout -b "%1"

:End

ECHO Done!