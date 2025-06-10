SELECT *
FROM {{ ref('stg_customers') }}
WHERE risk_score < 500 OR risk_score > 800