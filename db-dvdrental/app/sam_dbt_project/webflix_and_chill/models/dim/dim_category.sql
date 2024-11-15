{{ config(
    materialized = "table"
) }}

SELECT
    *
FROM
    {{ ref('category') }} AS category
