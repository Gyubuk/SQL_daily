-- 코드를 입력하세요
--  우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니가 있는지 알아보려 합니다
-- 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문
-- 이때 결과는 장바구니의 아이디 순
-- SELECT CART_ID
-- FROM CART_PRODUCTS
-- GROUP BY CART_ID


-- CASE WHEN으로 있으면 뭐 없으면 뭐로 나눌 수 있는데 SELECT가 되니까
-- 내 생각엔 서브 쿼리로 만드는 방향이 맞을거 같음.

WITH CART AS(
    SELECT CART_ID, COUNT(DISTINCT NAME) AS C
    FROM CART_PRODUCTS
    WHERE NAME IN('Milk', 'Yogurt')
    GROUP BY CART_ID
    HAVING C >=2
)
SELECT CART_ID
FROM CART
ORDER BY CART_ID