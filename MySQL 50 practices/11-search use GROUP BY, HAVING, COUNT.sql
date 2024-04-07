use practice;
select * from sc;
select sno, avg(score) from sc
where score < 60
group by sno
having count(sno) >= 2;