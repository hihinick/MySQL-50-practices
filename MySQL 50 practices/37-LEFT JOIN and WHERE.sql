use practice;

select sno, sname from sc
left join student using(sno)
where cno = 'c001' and score >= 80;
