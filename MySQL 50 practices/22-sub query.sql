use practice;
select distinct sno from sc;
select sno, sname from student
where sno not in(select distinct sno from sc);