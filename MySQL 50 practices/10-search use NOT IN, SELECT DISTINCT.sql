use practice;
select * from student;
select * from course;
--  篩選出有選'諶燕'老師的課的學生
select *
from sc left join student using(sno) left join course using(cno) left join teacher using(tno)
where tname in ('諶燕');
-- 排除""" 有選'諶燕'老師的課的學生 """
select *
from student
where sname not in(select distinct sname
from sc left join student using(sno) left join course using(cno) left join teacher using(tno)
where tname in ('諶燕'));