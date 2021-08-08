drop procedure if exists pro1;
delimiter $
create procedure pro1()
lbl1:begin
 select ename,sal,job,deptno from emp where deptno=10;
end lbl1 $
delimiter ;

