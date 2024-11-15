{{ config(
    materialized = "table"
) }}

SELECT
    film.film_id,
    film.title film_title,
    film.description film_description,
    film.release_year,
    film.special_features,
    film.rating
FROM
    {{ source(
        'dvd_rental',
        'film'
    ) }} AS film
