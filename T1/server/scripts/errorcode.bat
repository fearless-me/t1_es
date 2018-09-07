
echo off

CHCP 65001
cls

cd ../../Tools/ErrorCode
start /B /wait python ErrorCodeMaker.py

exit