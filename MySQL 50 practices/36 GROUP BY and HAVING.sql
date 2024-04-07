use practice;

select sno, sname, avg(score) from sc
left join student using(sno)
group by sno
having avg(score) > 85;
