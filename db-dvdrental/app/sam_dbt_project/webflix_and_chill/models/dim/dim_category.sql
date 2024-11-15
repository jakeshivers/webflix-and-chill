{{ config(
    materialized = "table"
) }}

SELECT
    *
FROM
    {{ source(
        'dvd_rental',
        'category'
    ) }} AS cust
