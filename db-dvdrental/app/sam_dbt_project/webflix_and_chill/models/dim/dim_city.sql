{{
    config(
        materialized="table"
    )
}}

select
    city.city_id
    ,city.city
    ,country.country
FROM {{ source('dvd_rental', 'city') }} as city
JOIN {{ source('dvd_rental', 'country') }} as country
    ON city.country_id = country.country_id



