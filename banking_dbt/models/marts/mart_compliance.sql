{{ config(materialized='view') }}

SELECT
    MD5(
        CAST(c.customer_id AS STRING) || '_' || CAST(l.loan_id AS STRING)
    ) AS compliance_check_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    l.loan_id,
    l.loan_amount,
    COUNT(p.payment_id) AS num_payments,
    MAX(p.payment_date) AS last_payment_date,
    CASE 
        WHEN MAX(p.payment_date) < DATEADD(DAY, -90, CURRENT_DATE) THEN 'Non-Compliant'
        ELSE 'Compliant'
    END AS compliance_status
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('stg_loans') }} l ON c.customer_id = l.customer_id
LEFT JOIN {{ ref('stg_payments') }} p ON l.loan_id = p.loan_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    l.loan_id,
    l.loan_amount