use practive;
select sno, score from sc right join course using(cno)
where cname = 'Oracle' and score < 60;