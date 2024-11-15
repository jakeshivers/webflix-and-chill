{{ config(
    materialized = 'view',
    schema = 'source'
) }}

SELECT
    *
FROM
    {{ source(
        'dvd_rental',
        'inventory'
    ) }}
