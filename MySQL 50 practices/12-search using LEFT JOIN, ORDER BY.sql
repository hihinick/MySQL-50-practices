use practice;
select sno 
from student left join sc using(sno)
where cno = 'c004' and score < 60
order by score desc;