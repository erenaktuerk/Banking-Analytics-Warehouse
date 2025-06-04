-- banking_dbt/models/marts/mart_compliance.sql

SELECT
    c.customer_id,
    c.name,
    l.loan_id,
    l.loan_amount,
    COUNT(p.payment_id) AS num_payments,
    MAX(p.payment_date) AS last_payment_date,
    CASE 
        WHEN MAX(p.payment_date) < CURRENT_DATE - INTERVAL '90' DAY THEN 'Non-Compliant'
        ELSE 'Compliant'
    END AS compliance_status
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('stg_loans') }} l ON c.customer_id = l.customer_id
LEFT JOIN {{ ref('stg_payments') }} p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.name, l.loan_id, l.loan_amount;