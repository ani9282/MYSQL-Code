drop function if exists f1;
delimiter $
create function f1(x int , y int) returns int
begin
	return(ifnull(x,0) + ifnull(y,0));
end $

delimiter ;
