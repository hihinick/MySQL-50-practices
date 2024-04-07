use practice;
select distinct cno from sc where sno = 's001';
select distinct sno, sname from sc left join student using(sno)
where cno in (select distinct cno from sc where sno = 's001') and cno <> 's001';
