@ECHO OFF

ECHO Checking out develop branch
git checkout develop

ECHO Here's your status
git status

PAUSE

ECHO Pushing develop branch to remote
git push origin develop --tags

ECHO Done!
GOTO End

:MissingMessageError
ECHO You did not enter the commit message!
GOTO End

:End
