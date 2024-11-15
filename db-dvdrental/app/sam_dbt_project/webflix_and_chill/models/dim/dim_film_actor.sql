{{ config(
    materialized = "table"
) }}

SELECT
    *
FROM
    {{ source(
        'dvd_rental',
        'film_actor'
    ) }}
