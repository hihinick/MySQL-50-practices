use practice;
-- 我的解法
		select cno from sc where sno = 's005';
		-- s005選了c001, c004的課
	select sno from sc where cno not in(select cno from sc where sno = 's005');
	-- 沒有選c001, c004課的人
select distinct sno, sname from sc left join student using(sno)
where sno not in(select sno from sc where cno not in(select cno from sc where sno = 's005')) 
and sno <> 's005';

-- 網路解法1
SELECT sno,sname
FROM sc x LEFT JOIN student USING(sno)
WHERE cno IN(SELECT cno FROM sc WHERE sno = 's005') -- 有選c001或c004課的人
GROUP BY sno
HAVING COUNT(cno)=(SELECT COUNT(*) FROM sc WHERE sno = 's005') -- 選2堂課的人 
AND (SELECT COUNT(*) FROM sc WHERE sno = 's005') = ALL(SELECT COUNT(cno) FROM sc y WHERE x.sno=y.sno ) 
AND sno <> 's005';

SELECT COUNT(*) FROM sc WHERE sno = 's005';

SELECT sno,sname;
select *
FROM sc x LEFT JOIN student USING(sno)
WHERE cno IN(SELECT cno FROM sc WHERE sno = 's005');
GROUP BY sno;
HAVING COUNT(cno)=(SELECT COUNT(*) FROM sc WHERE sno = 's005') ;


-- 網路解法2
SELECT sno,sname
FROM sc LEFT JOIN student USING(sno)
GROUP BY sno
HAVING GROUP_CONCAT(cno ORDER BY cno) =(SELECT GROUP_CONCAT(cno ORDER BY cno)FROM sc WHERE sno='s005')
AND sno <> 's005';
	-- 這裡用到GROUP CONCAT 可以將字串合併，再用ORDER BY的方式排序
	SELECT GROUP_CONCAT(cno ORDER BY cno)FROM sc 
	GROUP BY sno;
	-- 用score作為ORDER BY的GROUP CONCAT 結果跟用cno作為ORDER BY不一樣
	SELECT GROUP_CONCAT(cno ORDER BY score)FROM sc 
	GROUP BY sno;