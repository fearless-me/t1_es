@echo off
echo "commit local....."
chcp 65001
echo "windows"

git commit -a -m "auto commit"


echo "push to remote....."   
git push --progress "origin" master:master

echo all done!
pause 

