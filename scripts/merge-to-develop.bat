@ECHO OFF

SET /P "BRANCH=Please insert the name of the branch you want to merge into develop: "
IF "%BRANCH%"=="" GOTO ErrorMissingBranch
IF "%BRANCH%"=="develop" GOTO ErrorDevelopBranch

ECHO Checking out develop branch
git checkout develop

ECHO Merging the %BRANCH% branch into the develop branch
git merge "%BRANCH%"

IF NOT "%ERRORLEVEL%"==0 GOTO DoNotDelete

IF "%BRANCH%"=="master" GOTO ErrorMasterBranch
IF NOT "%1"=="delete" GOTO DoNotDelete

ECHO Deleting the "%BRANCH%" branch 
git branch -d "%BRANCH%"

:DoNotDelete

ECHO Done!

GOTO End

ErrorMissingBranch
ECHO [ERROR] You did not enter the name of the branch!
GOTO End

ErrorDevelopBranch
ECHO [ERROR] You can't merge the develop branch onto itself!
GOTO End

ErrorMasterBranch
ECHO [ERROR] You really should not delete the master branch!
GOTO End

:End
