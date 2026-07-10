-- 코드를 작성해주세요
WITH SKILL_MASK AS (
    SELECT
        SUM(CASE
                WHEN CATEGORY = 'Front End' THEN CODE
                ELSE 0
            END) AS FRONT_END_CODE,

        MAX(CASE
                WHEN NAME = 'Python' THEN CODE
            END) AS PYTHON_CODE,
        MAX(CASE
                WHEN NAME = 'C#' THEN CODE
            END) AS CSHARP_CODE
    FROM SKILLCODES
),
GRADED_DEVELOPERS AS (
    SELECT
        CASE
            WHEN (d.SKILL_CODE & s.FRONT_END_CODE) > 0
            AND (d.SKILL_CODE & s.PYTHON_CODE) > 0
                THEN 'A'
    
            WHEN (d.SKILL_CODE & s.CSHARP_CODE) > 0 
                THEN 'B'
                  
            WHEN (d.SKILL_CODE & s.FRONT_END_CODE) > 0
                THEN 'C'
        END AS GRADE,
        d.ID,
        d.EMAIL
    FROM DEVELOPERS d
    CROSS JOIN SKILL_MASK s
)

SELECT
    GRADE,
    ID,
    EMAIL
FROM GRADED_DEVELOPERS
WHERE GRADE IS NOT NULL
ORDER BY
    GRADE ASC,
    ID ASC;
    