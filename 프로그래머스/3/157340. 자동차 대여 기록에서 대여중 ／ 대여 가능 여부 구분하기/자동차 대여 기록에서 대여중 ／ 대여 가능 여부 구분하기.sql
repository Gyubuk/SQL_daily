-- 코드를 입력하세요
--  2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시
-- 대여 중이지 않은 자동차인 경우 '대여 가능'을 표시하는 컬럼(컬럼명: AVAILABILITY)을 추가
-- 자동차 ID와 AVAILABILITY 리스트를 출력하는 SQL문
-- 이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시 : CASE WHEN
--  결과는 자동차 ID를 기준으로 내림차순 정렬
SELECT CAR_ID,
    MAX(CASE WHEN START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16' THEN '대여중' ELSE '대여 가능' END) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;


-- 근데 자동차가 겹치는데 가장 최근을 어떻게 분리하지? -> MAX()
-- CAR_ID로 묶고 거기서 가장 최근을 MAX로 걸러내기
-- 한줄평 : 나 진짜 천재인가?
-- 사실 강의에 있었음