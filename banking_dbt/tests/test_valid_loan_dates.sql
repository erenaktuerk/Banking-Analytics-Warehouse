SELECT *
FROM {{ ref('stg_loans') }}
WHERE end_date <= start_date