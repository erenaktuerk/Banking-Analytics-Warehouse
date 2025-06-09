{{ config(materialized='view') }}

-- Staging customers from raw layer
SELECT
    customer_id::INT            AS customer_id,
    first_name::STRING          AS first_name,
    last_name::STRING           AS last_name,
    birth_date::DATE            AS birth_date,
    gender::STRING              AS gender,
    country::STRING             AS country,

    -- Simulierter Risk Score (zwischen 500 und 800)
    UNIFORM(500, 800, RANDOM())::INT AS risk_score

FROM {{ source('raw', 'customers') }}