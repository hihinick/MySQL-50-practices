use practice;
-- 第一種寫法
select sname from student
where left(sname, 1) = '張';
-- 第二種寫法
select sname from student
WHERE sname LIKE '張%';