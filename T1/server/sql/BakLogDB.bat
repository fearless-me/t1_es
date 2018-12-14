echo off
cls
del /S /Q t1_log.sql

mysqldump --opt -d -R -uroot -p1234 -B t1_log  > .\t1_log.sql
