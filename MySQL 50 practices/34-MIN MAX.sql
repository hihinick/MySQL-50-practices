use practice;
-- my answer
select * from student
where sage = (select min(sage) from student)
or sage = (select max(sage) from student);
-- answer from web
SELECT *
FROM student
WHERE sno IN(SELECT sno FROM student x WHERE (SELECT COUNT(*) FROM student y WHERE x.sage > y.sage)<1)
OR sno IN(SELECT sno FROM student x WHERE (SELECT COUNT(*) FROM student y WHERE x.sage < y.sage)<1)