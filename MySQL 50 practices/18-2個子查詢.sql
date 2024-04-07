use practice;



-- 我自己的解題邏輯 
	select sno from sc left join student using(sno) where cno = 'c001'
	-- 有選c001課程的學生 = s001, s002, s003, s004, s005
select sno, sname
from sc left join student using(sno)
where sno in (select sno from sc left join student using(sno) where cno = 'c001') and cno = 'c002';
-- s001, s002, s003, s004, s005學生有修c002的人


-- 網路上的解題邏輯
SELECT sno,sname
FROM student
WHERE sno IN(SELECT a.sno
FROM sc a,sc b 
WHERE a.sno=b.sno AND a.cno='c001' AND b.cno='c002'); 