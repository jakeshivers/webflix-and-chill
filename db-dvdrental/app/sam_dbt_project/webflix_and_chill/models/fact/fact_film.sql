{{ config(
    materialized = "incremental"
) }}

SELECT
    film_id,
    {{ dbt_utils.generate_surrogate_key(
        ['film_id', 'last_update']
    ) }} AS film_surrogate_key,
    LENGTH,
    rating,
    rental_rate,
    release_year,
    rental_duration,
    replacement_cost,
    last_update
FROM
    {{ ref('film') }}
