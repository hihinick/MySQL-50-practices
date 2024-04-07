use practice;
select student.sname, course.cname 
from student left join sc using(sno) left join course using(cno);

