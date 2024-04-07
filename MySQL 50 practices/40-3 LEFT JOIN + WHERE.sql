use practice;

select sname, max(score) from sc
left join student using(sno)
left join course using(cno)
left join teacher using(tno)
where tname = "諶燕";