use practice;

select * from sc
group by cno
order by score desc
limit 3; 

SELECT *
FROM sc x
WHERE (SELECT COUNT(*) FROM sc y WHERE x.cno = y.cno AND x.score < y.score)<3 
ORDER BY cno,score DESC;

-- 先看
select *
from sc as s1
inner join sc as s2
on s1.cno = s2.cno;

-- 再看
select *
from sc as s1
inner join sc as s2
on s1.cno = s2.cno and s1.score >= s2.score
order by s1.cno, s1.score;

-- 然后是
select s1.cno,s1.score,count(s2.score);
select *,count(s2.score)
from sc as s1
inner join sc as s2
on s1.cno = s2.cno and s1.score >= s2.score
group by s1.cno,s1.score;

-- https://www.jianshu.com/p/fff5d1f71c0f 看這個
