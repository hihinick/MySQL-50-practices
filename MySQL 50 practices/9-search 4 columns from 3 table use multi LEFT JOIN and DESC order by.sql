use practice;
select sno, cno, cname, score
from sc left join student using(sno) left join course using(cno)
where score < 60
order by cno desc;