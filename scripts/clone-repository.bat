@ECHO OFF

ECHO Initializing git
git init 

SET /P "REMOTE=Please insert the URL of your remote repository (with password): "
IF "%REMOTE%"=="" GOTO ErrorMissingRemote

ECHO Initializing git
git remote add origin "%REMOTE%"

ECHO Fetching
git fetch origin

ECHO Creating local branches from remote origins
git checkout -b develop origin/develop
git checkout -b master origin/master

ECHO Checking out develop
git checkout develop

ECHO Done!

GOTO End

:ErrorMissingRemote
ECHO [ERROR] You did not enter the remote repository url!
GOTO End

:End
