SELECT *
FROM {{ ref('stg_payments') }}
WHERE payment_amount <= 0