@ECHO OFF

ECHO Here are your branches
git branch
ECHO(

SET /P "BRANCH=Please insert the name of the feature branch you want to delete: "
IF "%BRANCH%"=="" GOTO ErrorMissingBranch
IF "%BRANCH%"=="develop" GOTO ErrorDevelopBranch
IF "%BRANCH%"=="master" GOTO ErrorMasterBranch

ECHO Checking out the develop branch
git checkout develop

ECHO(
ECHO Here's the branch status. If something off, please exit now with CTR+C and fix it!
ECHO(

git status 
ECHO(
PAUSE

ECHO Deleting the %BRANCH% branch 
git branch --delete %BRANCH%

ECHO Done!

GOTO End

ErrorMissingBranch
ECHO [ERROR] You did not enter the name of the feature branch!
GOTO End

ErrorDevelopBranch
ECHO [ERROR] You really should not delete the develop branch!
GOTO End

ErrorMasterBranch
ECHO [ERROR] You really should not delete the master branch!
GOTO End

:End
