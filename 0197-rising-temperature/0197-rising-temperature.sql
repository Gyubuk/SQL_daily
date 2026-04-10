-- 이전날보다 높은 온도인것을 내는 것 같음
-- 날짜 같은 것 없어
with yesterday as(
    SELECT *, LAG(temperature) over (order by recordDate) AS Yesterday_tem,
    LAG(recordDate) over (order by recordDate) AS Yesterday_date
    FROM Weather
)
select id
from yesterday
where temperature - Yesterday_tem > 0 and recordDate - Yesterday_date = 1