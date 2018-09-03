@echo off
echo "commit local....."
CHCP utf8

git commit -a -m "auto commit"


echo "push to remote....."   
git push --progress "origin" master:master

echo all done!
pause 

