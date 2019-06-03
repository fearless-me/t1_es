@echo off
echo "commit local....."
chcp 65001
echo "master-windows"

git commit -a -m "auto commit"


echo "push to remote....."   
git push --progress "origin" master:master

echo all done!
pause 

