use practice;
select sno, avg(score)
from sc
group by sno
having avg(score) > 60
;
