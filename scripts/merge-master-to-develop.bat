@ECHO OFF

ECHO Checking out develp branch
git checkout develp

ECHO Merging the master branch into the develop branch
git merge develp

ECHO Done!