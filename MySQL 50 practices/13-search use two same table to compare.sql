USE practice;
SELECT a.sno
FROM sc a,sc b
WHERE a.sno = b.sno and a.cno='c001' and b.cno='c002' and a.score > b.score;
