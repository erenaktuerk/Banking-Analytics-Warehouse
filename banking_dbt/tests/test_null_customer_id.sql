SELECT *
FROM {{ ref('stg_customers') }}
WHERE customer_id IS NULL