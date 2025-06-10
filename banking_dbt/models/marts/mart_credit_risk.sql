{{ config(materialized='view') }}

WITH payments_agg AS (
    SELECT
        loan_id,
        SUM(payment_amount) AS total_paid
    FROM {{ ref('stg_payments') }} AS p
    GROUP BY loan_id
),
loan_info AS (
    SELECT
        l.loan_id,
        l.customer_id,
        l.loan_amount,
        COALESCE(p.total_paid, 0) AS total_paid,
        (l.loan_amount - COALESCE(p.total_paid, 0)) AS outstanding_amount
    FROM {{ ref('stg_loans') }} AS l
    LEFT JOIN payments_agg AS p ON l.loan_id = p.loan_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.risk_score,
    l.loan_id,
    l.loan_amount,
    l.total_paid,
    l.outstanding_amount,
    CASE 
        WHEN c.risk_score < 600 THEN 'High Risk'
        WHEN c.risk_score BETWEEN 600 AND 699 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM loan_info AS l
JOIN {{ ref('stg_customers') }} AS c ON l.customer_id = c.customer_id