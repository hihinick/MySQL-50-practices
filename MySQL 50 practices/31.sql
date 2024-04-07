use practice;
-- My Answer
select sno, sname from sc
left join student using(sno)
group by sno
having count(cno) = 2;

-- Answer from web
SELECT sno,sname
FROM sc LEFT JOIN student USING(sno)
GROUP BY sno
HAVING COUNT(*)=2;