{{ config(
    materialized = "table",
    schema = "marts"
) }}

SELECT
    df.film_title,
    df.film_description,
    f.release_year,
    f.length,
    df.rating,
    df.special_features,
    CONCAT(
        A.first_name,
        ' ',
        A.last_name
    ) AS actor_name,
    C.name AS category
FROM
    {{ ref(
        'fact_film'
    ) }} AS f
    JOIN {{ ref(
        'dim_film'
    ) }} AS df
    ON df.film_id = f.film_id
    LEFT JOIN {{ ref('dim_film_actor') }} AS fa
    ON f.film_id = fa.film_id
    LEFT JOIN {{ ref('dim_actor') }} AS A
    ON fa.actor_id = A.actor_id
    LEFT JOIN {{ ref('dim_film_category') }} AS fc
    ON f.film_id = fc.film_id
    LEFT JOIN {{ ref('dim_category') }} AS C
    ON fc.category_id = C.category_id
