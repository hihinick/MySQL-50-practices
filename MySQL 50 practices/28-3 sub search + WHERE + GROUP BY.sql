use practice;
cno, cname, verygood, good, bad;
-- very good
select *, count(*) as verygood from sc 
left join course using(cno)
left join teacher using(tno)
group by cname
having score >= 86 and score <= 100;

select *, count(*) as verygood from sc
left join course using(cno)
left join teacher using(tno)
where score >= 86 and score <= 100
group by cname;

-- good
select *, count(*) as good from sc 
left join course using(cno)
left join teacher using(tno)
where score <= 85 and score >= 71
group by cname;

-- bad
select *, count(*) as bad from sc 
left join course using(cno)
left join teacher using(tno)
group by cname
having score <= 60;
-- 我的解法
select distinct(cno), course.cname, ifnull(verygood, 0) as "verygood[100-86]", ifnull(good, 0) as "good[85-71]", ifnull(bad, 0) as "bad[<60]" from sc
left join course using(cno)
left join(select *, count(*) as verygood from sc 
left join course using(cno)
left join teacher using(tno)
where score >= 86 and score <= 100
group by cno) as VERYGOOD using(cno)
left join (select *, count(*) as good from sc 
left join course using(cno)
left join teacher using(tno)
where score <= 85 and score >= 71
group by cno) as GOOD using(cno)
left join (select *, count(*) as bad from sc 
left join course using(cno)
left join teacher using(tno)
where score <= 60
group by cno) as BAD using(cno)
order by cno;
-- 網路解法
SELECT cno,cname,COALESCE(verygoodc,0)verygood, COALESCE(goodc,0)good, COALESCE(badc,0)bad
FROM sc LEFT JOIN (SELECT cno,COUNT(*) verygoodc FROM sc WHERE score BETWEEN 86 AND 100 GROUP BY cno)AS verygoodsc USING(cno)
LEFT JOIN (SELECT cno,COUNT(*) goodc FROM sc WHERE score BETWEEN 71 AND 85 GROUP BY cno)AS goodsc USING(cno)
LEFT JOIN (SELECT cno,COUNT(*) badc FROM sc WHERE score < 60 GROUP BY cno)AS badsc USING(cno)
LEFT JOIN course USING(cno)
GROUP BY cno;