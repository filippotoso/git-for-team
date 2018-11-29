@ECHO OFF

SET /P "BRANCH=Please insert the name of the branch you want to merge into master: "
IF "%BRANCH%"=="" GOTO ErrorMissingBranch
IF "%BRANCH%"=="master" GOTO ErrorMasterBranch

ECHO Checking out master branch
git checkout master

ECHO Merging the %BRANCH% branch into the master branch
git merge "%BRANCH%"

IF NOT "%ERRORLEVEL%"==0 GOTO DoNotDelete

IF "%BRANCH%"=="develop" GOTO ErrorDevelopBranch
IF NOT "%1"=="delete" GOTO DoNotDelete

ECHO Deleting the "%BRANCH%" branch 
git branch -d "%BRANCH%"

:DoNotDelete

ECHO Done!

GOTO End

ErrorMissingBranch
ECHO [ERROR] You did not enter the name of the fix branch!
GOTO End

ErrorDevelopBranch
ECHO [ERROR] You really should not delete the develop branch!
GOTO End

ErrorMasterBranch
ECHO [ERROR] You can't merge the master branch onto itself!
GOTO End

:End
