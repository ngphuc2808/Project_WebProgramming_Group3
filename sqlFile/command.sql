create database Daugiatructuyen;

create event increaseTimeInserted on schedule every 1 day
do update products set timeInserted = timeInserted + 1;