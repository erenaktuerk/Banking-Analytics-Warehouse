{{ config(materialized='view') }}

-- Staging payments from raw layer
SELECT
    payment_id::INT             AS payment_id,
    loan_id::INT                AS loan_id,
    payment_date::DATE          AS payment_date,
    amount::FLOAT               AS payment_amount
FROM {{ source('raw', 'payments') }}