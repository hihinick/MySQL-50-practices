use practice;
show columns in course;
show tables in practice;
describe course;
--  第一種寫法
select count(*)
from course right join teacher using(tno)
where tname='諶燕';
--  第二種寫法
select count(*)
from course right join teacher on course.tno = teacher.tno
where tname='諶燕';
