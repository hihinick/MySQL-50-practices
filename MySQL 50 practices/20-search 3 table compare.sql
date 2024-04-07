use practice;
SELECT a.sno
FROM sc a,sc b, sc c
WHERE a.sno = b.sno AND b.sno = c.sno AND a.cno='c004' AND b.cno='c002' AND c.cno = 'c001'
 AND c.score > b.score AND c.score > a.score;