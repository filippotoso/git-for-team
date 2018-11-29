@ECHO OFF

ECHO Here's your status
git status

PAUSE

ECHO Adding new changes
git add .
git status

SET /P MESSAGE=Please enter the commit message: 
IF "%MESSAGE%"=="" GOTO MissingMessageError

ECHO Creating commit
git commit -m "%MESSAGE%"

ECHO Done!
GOTO End

:MissingMessageError
ECHO You did not enter the commit message!
GOTO End

:End
