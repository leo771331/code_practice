    -- 코드를 입력하세요
    WITH RENTAL_INFO AS(
        SELECT
        h.HISTORY_ID,
        c.CAR_TYPE,
        c.DAILY_FEE,
        DATEDIFF(h.END_DATE, h.START_DATE) + 1 AS RENTAL_DAYS
        FROM CAR_RENTAL_COMPANY_CAR c
        JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h
            ON c.CAR_ID = h.CAR_ID
        WHERE c.CAR_TYPE = '트럭'
    )

    SELECT
        r.HISTORY_ID,
        ROUND(
                r.DAILY_FEE
                * r.RENTAL_DAYS
                * (
                    1 - IFNULL(p.DISCOUNT_RATE, 0)/ 100
                )
        ) AS FEE
    FROM RENTAL_INFO r
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p
        ON r.CAR_TYPE = p.CAR_TYPE
        AND p.DURATION_TYPE =
            CASE
                WHEN r.RENTAL_DAYS >= 90 THEN '90일 이상'
                WHEN r.RENTAL_DAYS >= 30 THEN '30일 이상'
                WHEN r.RENTAL_DAYS >= 7 THEN '7일 이상'
            END
    ORDER BY
        FEE DESC,
        r.HISTORY_ID DESC;