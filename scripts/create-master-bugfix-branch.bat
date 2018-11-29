@ECHO OFF

ECHO Checking out master branch
git checkout master

SET /P "BRANCH=Please insert the name of the new fix branch: "
IF "%BRANCH%"=="" GOTO ErrorMissingBranch

ECHO Creating the %BRANCH% branch from master
git checkout -b %BRANCH% master

ECHO Done!

GOTO End

ErrorMissingBranch
ECHO [ERROR] You did not enter the name of the new fix branch!
GOTO End

:End
