use practice;

select sname, count(sname) from student
group by sname
having count(sname) > 1;