{{ config(materialized='view') }}

-- Staging payments from raw layer, filter payments with valid loan_id only
SELECT
    payment_id::INT          AS payment_id,
    loan_id::INT             AS loan_id,
    payment_date::DATE       AS payment_date,
    amount::FLOAT            AS payment_amount

FROM {{ source('raw', 'payments') }} p
WHERE
    payment_id IS NOT NULL
    AND loan_id IS NOT NULL
    AND amount >= 0
    AND loan_id IN (
        SELECT id FROM {{ source('raw', 'loans') }}
        WHERE id IS NOT NULL
    )