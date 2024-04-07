use practice;
select *, avg(score), count(sno) from sc
group by cno
order by avg(score) desc, cno asc;
select score from(select score from sc where score>60);

select cno, avg(score)from sc
group by cno;

select cno, count(sno) up60  from sc
where score > 0
group by cno;

-- concat是合併數字跟"&"的部分，round是取小數點到第幾位，ifnull跟coalesce都是替換掉null值
select cno, avg(score), concat(round((ifnull(up60,0)/total)*100, 2), "%") as passing from sc
left join (select cno, count(*) as up60 from sc where score >= 60 group by cno) as up60 using(cno)
left join (select cno, count(*) as total from sc group by cno) as total using(cno) 
group by cno
order by avg(score);

SELECT cno,AVG(score),CONCAT(ROUND(COALESCE(count,0)/tcount,2)*100,'%')AS passing FROM sc 
LEFT JOIN (SELECT cno,COUNT(*) AS count FROM sc WHERE score > 60 GROUP BY cno)AS pass USING(cno)
LEFT JOIN (SELECT cno,COUNT(*) AS tcount FROM sc GROUP BY cno)AS total USING(cno)
GROUP BY cno
ORDER BY AVG(score);