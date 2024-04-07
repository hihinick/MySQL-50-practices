use practice;
select cno, max(score), min(score) from sc
group by cno;