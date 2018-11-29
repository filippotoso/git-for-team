@ECHO OFF

ECHO Initializing git
git init 

SET /P "REMOTE=Please insert the URL of your remote repository (with password): "
IF "%REMOTE%"=="" GOTO ErrorMissingRemote

ECHO Initializing git
git remote add origin "%REMOTE%"

ECHO Creating setup commit
git add . 
git commit -m "Setup commit" 
git tag -a v0.0.1 -m "Setup commit"

ECHO Creating the develop branch
git branch develop

ECHO Here are your branches
git branch

ECHO Pushing master branch to remote
git push origin master --tags

ECHO Pushing develop branch to master
git push origin develop --tags

ECHO Done!

GOTO End

:ErrorMissingRemote
ECHO [ERROR] You did not enter the remote repository url!
GOTO End

:End
