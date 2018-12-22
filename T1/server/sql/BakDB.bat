echo off
cls
del /S /Q t1.sql

mysqldump --opt -d -R -uroot -p1234 -B t1_account t1_conf t1_data t1_public t1_log > .\t1.sql
