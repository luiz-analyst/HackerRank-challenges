SELECT a.hacker_id,
a.name,
SUM(a.max_score) as total_score
FROM
(SELECT h.hacker_id,
h.name,
s.challenge_id,
MAX(score) as max_score
FROM hackers as h
INNER JOIN submissions as s
ON h.hacker_id = s.hacker_id
GROUP BY 1,2,3) as a
GROUP BY 1,2
HAVING SUM(max_score) > 0
ORDER BY 3 DESC, 1 ASC
;
