@ECHO OFF

SET /P "BRANCH=Please insert the name of the new feature branch: "
IF "%BRANCH%"=="" GOTO ErrorMissingBranch

ECHO Creating the %BRANCH% branch from develop
git checkout -b %BRANCH% develop

ECHO Done!

GOTO End

ErrorMissingBranch
ECHO [ERROR] You did not enter the name of the new feature branch!
GOTO End

:End
