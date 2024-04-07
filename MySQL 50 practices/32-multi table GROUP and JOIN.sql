use practice;
-- 32
select ssex, count(ssex) from student
group by ssex;

-- 32-1
-- 拆解動作1: 找出女生人數
select *, count(ssex) as girl from sc
left join student using(sno)
group by cno, ssex
having ssex = '女';
-- 拆解動作2: 找出男生人數
select *, count(ssex) as boy from sc
left join student using(sno)
group by cno, ssex
having ssex = '男';
-- 拆解動作3 把course table跟男女生人數合併
select cno, cname, coalesce(girl, 0) as girls, coalesce(boy, 0) as boys from course
left join (select *, count(ssex) as girl from sc
left join student using(sno)
group by cno, ssex
having ssex = '女') as GIRL using(cno)
left join (select *, count(ssex) as boy from sc
left join student using(sno)
group by cno, ssex
having ssex = '男') as BOY using(cno);




