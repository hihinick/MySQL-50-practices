use practice;
select sno, sname, COUNT(cno) as 選課數, sum(score) 總成績 
from sc left join student using(sno)
group by sno;