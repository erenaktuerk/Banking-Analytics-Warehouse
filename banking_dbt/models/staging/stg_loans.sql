-- banking_dbt/models/staging/stg_loans.sql

SELECT
    id::INT AS loan_id,
    customer_id::INT,
    loan_amount::FLOAT,
    start_date::DATE,
    end_date::DATE
FROM {{ source('raw', 'loans') }};