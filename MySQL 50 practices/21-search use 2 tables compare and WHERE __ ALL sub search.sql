use practice;
-- 我一開始寫的，邏輯有問題，平均成績>60 不太表每一科都>60
select sno, sname from(select *, count(cno), sum(score), sum(score)/count(cno) as perS_avg 
from sc left join student using(sno)
group by sno
having perS_avg<60) a;

SELECT DISTINCT sno, sname
FROM sc x left join student using(sno)
WHERE 60 > ALL(SELECT score FROM sc y WHERE x.sno=y.sno)