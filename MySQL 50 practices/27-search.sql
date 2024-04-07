use practice;
select tname, cname, avg(score) from sc 
left join course using(cno)
left join teacher using(tno)
group by cname
order by avg(score) desc;
