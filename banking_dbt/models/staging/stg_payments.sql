-- banking_dbt/models/staging/stg_payments.sql

SELECT
    payment_id::INT,
    loan_id::INT,
    payment_date::DATE,
    amount::FLOAT
FROM {{ source('raw', 'payments') }};