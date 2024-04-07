USE practice;

select cno, count(sno) as students from sc
group by cno;