WITH source AS (
    SELECT * FROM {{ ref('raw_customers') }}
),

calculated AS (
    SELECT 
        *,
        -- Age calculation (Reference date Dec 2025)
        FLOOR(DATEDIFF(year, dob, '2025-12-31')) AS age,
        -- Combined Income / Duration
        (total_salary + side_income + other_income) / NULLIF(duration, 0) AS avg_income_value
    FROM source
)

SELECT
    *,
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18–25'
        WHEN age BETWEEN 26 AND 35 THEN '26–35'
        WHEN age BETWEEN 36 AND 45 THEN '36–45'
        WHEN age BETWEEN 46 AND 55 THEN '46–55'
        ELSE 'Above 55' 
    END AS age_group,
    CASE 
        WHEN avg_income_value < 5000 THEN 'Below 5,000'
        WHEN avg_income_value BETWEEN 5000 AND 9999 THEN '5,000–9,999'
        WHEN avg_income_value BETWEEN 10000 AND 19999 THEN '10,000–19,999'
        WHEN avg_income_value BETWEEN 20000 AND 29999 THEN '20,000–29,999'
        WHEN avg_income_value BETWEEN 30000 AND 49999 THEN '30,000–49,999'
        WHEN avg_income_value BETWEEN 50000 AND 99999 THEN '50,000–99,999'
        WHEN avg_income_value BETWEEN 100000 AND 149999 THEN '100,000–149,999'
        ELSE '150,000 and above'
    END AS income_group
FROM calculated
