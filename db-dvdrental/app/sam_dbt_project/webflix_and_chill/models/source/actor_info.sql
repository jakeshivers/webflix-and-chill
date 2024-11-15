{{ config(
    materialized = 'view',
    schema = 'source'
) }}

SELECT
    *
FROM
    {{ source(
        'dvd_rental',
        'actor_info'
    ) }}
