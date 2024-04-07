-- -- 我的解法 
use practice;
select sno, sname, tname
from sc left join student using(sno) left join course using(cno) left join teacher using(tno)
group by sname
having count(tname) = 1 and tname = '劉陽';
select *
from sc left join student using(sno) left join course using(cno) left join teacher using(tno);

-- -- 網路解法 
		SELECT cno FROM course LEFT JOIN teacher USING(tno) WHERE tname='劉陽';
		-- [查詢cno = '劉陽'] = c003, c004, c008
	SELECT sno FROM sc
	WHERE cno NOT IN(SELECT cno FROM course LEFT JOIN teacher USING(tno) WHERE tname='劉陽');
	-- [查詢沒選劉陽的課(c003, c004, c008)的學生] = s001, s002, s003, s004, s005
SELECT DISTINCT sno,sname
FROM sc LEFT JOIN student USING(sno)
WHERE sno NOT IN (SELECT sno FROM sc
WHERE cno NOT IN(SELECT cno FROM course LEFT JOIN teacher USING(tno) WHERE tname='劉陽'));
-- [查詢 "只選" 劉陽的課(c003, c004, c008)的學生] = s06

select * from sc;
SELECT * FROM sc
	WHERE cno NOT IN(SELECT cno FROM course LEFT JOIN teacher USING(tno) WHERE tname='劉陽');
    
SELECT sno AS '學號',
sname AS '姓名'
FROM sc LEFT JOIN student using(sno)
WHERE sno NOT IN  (SELECT sno 
					FROM sc 
					WHERE cno NOT IN (SELECT DISTINCT cno 
                                           FROM course
                                           LEFT JOIN teacher using(tno)
                                           WHERE tname ='劉陽'));
