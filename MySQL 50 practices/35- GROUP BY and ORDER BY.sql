use practice;

select cno, avg(score) from sc
group by cno
order by avg(score) asc, cno desc; 