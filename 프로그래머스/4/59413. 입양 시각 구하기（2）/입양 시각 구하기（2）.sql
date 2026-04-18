-- 가상으로 시간이 들어있는 테이블을 만들어야해 
-- 일단 가상으로 만드는 방법을 몰라서 RECURSIVE 처음 알았습니다.
-- 이 문제는 못푼 문제라고 생각해요.
with RECURSIVE ZERO as (
    select 0 as HOUR
    UNION ALL
    SELECT HOUR + 1
    FROM ZERO
    WHERE HOUR < 23
)
SELECT Z.HOUR, COUNT(AO.ANIMAL_ID) AS COUNT
FROM ZERO Z 
    LEFT JOIN ANIMAL_OUTS AO ON Z.HOUR = HOUR(AO.DATETIME)
GROUP BY Z.HOUR
ORDER BY Z.HOUR

-- Fwg hso