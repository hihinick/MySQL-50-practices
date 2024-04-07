use practice;
-- my answer
select A.sno,  A.cno as class_1, B.cno as class_2, A.score from sc A, sc B
where A.sno = B.sno and A.cno != B.cno and A.score = B.score;
-- my answer after edit
select distinct A.sno,  A.cno as class_1, A.score from sc A, sc B
where A.sno = B.sno and A.cno != B.cno and A.score = B.score;

-- answer from web
SELECT DISTINCT x.sno,x.cno,x.score
FROM sc x,sc y
WHERE x.sno=y.sno AND x.cno <> y.cno AND x.score=y.score