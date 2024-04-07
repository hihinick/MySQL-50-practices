use practice;

select * from sc;
order by score, cno, sno;

select ROW_NUMBER() OVER (order by score desc) as ranking 
from sc;
order by score;

SELECT sno, ROW_NUMBER() OVER (ORDER BY total_score DESC) AS ranking
FROM sc;

WITH TotalScores AS (
    SELECT sno, SUM(score) AS total_score
    FROM sc
    GROUP BY sno
);

SELECT sno, total_score, ROW_NUMBER() OVER (ORDER BY total_score DESC) AS ranking
FROM TotalScores;

SET @row_number := 0;
SELECT (@row_number:=@row_number + 1) AS row_number, column1, column2
FROM your_table;

SET @row_number := 0;

WITH TotalScores AS (
    SELECT sno, SUM(score) AS total_score
    FROM sc
    GROUP BY sno
);

SELECT 
    (@row_number := @row_number + 1) AS row_number,
    t.sno,
    t.total_score
FROM SC t
ORDER BY total_score DESC;

-- WEB ANSWER
SELECT sc.sno,
CASE WHEN @pre_parent_code=sc.cno 
THEN (CASE WHEN @prefontscore=sc.score THEN @curRank WHEN @prefontscore:=sc.score THEN @curRank:=@curRank+1 END)
WHEN  @prefontscore:=sc.score THEN  @curRank:=1 END AS rank ,sc.score,@pre_parent_code:=sc.cno AS cno
FROM (SELECT @curRank:=0,@pre_parent_code:='',@prefontscore:=NULL) r,sc
ORDER BY sc.cno,sc.score DESC