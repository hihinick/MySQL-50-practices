use practice;
select student.sname, course.cname, sc.score
from student left join sc using(sno) left join course using(cno)
where sc.score > 70;

SELECT sname,cname,score
FROM sc LEFT JOIN student USING(sno) LEFT JOIN course USING(cno)
WHERE score >= 70