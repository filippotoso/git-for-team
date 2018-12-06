@ECHO OFF

ECHO You are in the process of create a master release (with version number). 
ECHO If you are not ready, please exit right now with CTRL+C!
ECHO( 
PAUSE

ECHO Checking out master branch
git checkout master

ECHO Here's your status
git status

PAUSE

SET /P MESSAGE=Please enter the commit message: 
IF "%MESSAGE%"=="" GOTO MissingMessageError

ECHO Here are your releases versions:
git tag
ECHO( 

SET /P VERSION=Please enter the release version number: 
IF "%VERSION%"=="" GOTO Error

ECHO Creating version file

ECHO Version %VERSION% > version.txt
date /t >> version.txt
time /t >> version.txt

ECHO Adding changes
git add .

ECHO Creating commit
git commit -m "%MESSAGE%"
git tag -a "%VERSION%" -m "%MESSAGE%"

ECHO Pushing master branch to remote
git push origin master --tags

ECHO Done!
GOTO End

:MissingMessageError
ECHO You did not enter the commit message!
GOTO End

:MissingVersionError
ECHO You did not enter the version number!
GOTO End

:End