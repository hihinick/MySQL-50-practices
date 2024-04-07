use practice;
DESC course;
-- 查unique值
select distinct cname from course;
-- 加上count查unique值數量
select count(distinct cname) from course;
-- 
SELECT tname, COUNT(*)
FROM course LEFT JOIN teacher USING(tno)
GROUP BY tno;

