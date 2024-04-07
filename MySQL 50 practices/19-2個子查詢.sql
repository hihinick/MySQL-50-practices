use practice;
select * from student left join sc using(sno);

-- 我的解法1
		select tno from teacher where tname = '諶燕';
		-- 找出'諶燕'的tno = t002
	select cno from course where tno = (select tno from teacher where tname = '諶燕');
	-- 找出t002上的課程編號cno = c001, c002, c007, c010
select distinct sno, sname from sc left join student using(sno)
where cno in (select cno from course where tno = (select tno from teacher where tname = '諶燕'));
-- 找出有上c001, c002, c007, c010課程的學生

-- 我的解法2
 select distinct sno, sname from sc left join student using(sno) left join course using(cno) left join teacher using(tno)
 where tname = '諶燕';