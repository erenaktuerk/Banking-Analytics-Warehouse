SELECT *
FROM {{ ref('stg_loans') }}
WHERE loan_amount <= 0