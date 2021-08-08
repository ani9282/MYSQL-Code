drop procedure if exists pro1;
delimiter $
create procedure pro1()
l:begin
declare y varchar(10);
declare x varchar(10) default 'IET';
set y := 'Hello';
	select concat(y,' ' , x) as Message;
end l $
delimiter ;
