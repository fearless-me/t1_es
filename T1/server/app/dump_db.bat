cls 
rmdir /S /Q sql
mkdir sql
mysqldump --opt --no-data -uroot -p1234 t1_account >  .\sql\t1_account.sql
mysqldump --opt --no-data -uroot -p1234 t1_conf >  .\sql\t1_conf.sql
mysqldump --opt --no-data -uroot -p1234 t1_player > .\sql\t1_player.sql
mysqldump --opt --no-data -uroot -p1234 t1_public >  .\sql\t1_public.sql