{{ config(materialized='view') }}

-- Staging customers from raw layer
SELECT
    customer_id::INT                     AS customer_id,
    first_name::STRING                   AS first_name,
    last_name::STRING                    AS last_name,
    birth_date::DATE                     AS birth_date,
    gender::STRING                       AS gender,
    country::STRING                      AS country,

    -- Simulated risk score (banking context: 500–800, higher = safer)
    UNIFORM(500, 800, RANDOM())::INT     AS risk_score

FROM {{ source('raw', 'customers') }}
WHERE 
    customer_id IS NOT NULL
    AND birth_date IS NOT NULL
    AND gender IN ('M', 'F', 'D')  -- standardization to three permitted values
