{{ config(materialized='view') }}

-- Staging loans from raw layer
SELECT
    id::INT                  AS loan_id,
    customer_id::INT         AS customer_id,
    loan_amount::FLOAT       AS loan_amount,
    start_date::DATE         AS start_date,
    end_date::DATE           AS end_date
FROM {{ source('raw', 'loans') }}
WHERE
    id IS NOT NULL
    AND customer_id IS NOT NULL
    AND loan_amount > 0
    AND end_date > start_date