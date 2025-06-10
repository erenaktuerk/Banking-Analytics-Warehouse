SELECT *
FROM {{ ref('stg_payments') }} AS p
LEFT JOIN {{ ref('stg_loans') }} AS l ON p.loan_id = l.loan_id
WHERE l.loan_id IS NULL