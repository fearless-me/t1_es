echo off
cls
del /S /Q t1_account.sql
del /S /Q t1_conf.sql
del /S /Q t1_player.sql
del /S /Q t1_public.sql
mysqldump --opt --no-data -uroot -p1234 t1_account 	> .\t1_account.sql
mysqldump --opt --no-data -uroot -p1234 t1_conf 	> .\t1_conf.sql
mysqldump --opt --no-data -uroot -p1234 t1_data 	> .\t1_data.sql
mysqldump --opt --no-data -uroot -p1234 t1_public 	> .\t1_public.sql