-- Write your PostgreSQL query statement below

SELECT S.user_id, ROUND(1.0*SUM(CASE WHEN ACTION = 'confirmed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.USER_ID = C.USER_ID
GROUP BY S.user_id