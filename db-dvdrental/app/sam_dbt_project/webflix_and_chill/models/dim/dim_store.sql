{{
    config(
        materialized="table"
    )
}}

SELECT 
    store.store_id
    ,city.city
    ,address.district 
FROM {{ source('dvd_rental', 'store') }} store
JOIN {{ source('dvd_rental', 'address') }} address 
    on store.address_id = address.address_id
JOIN {{ source('dvd_rental', 'city') }} city 
    on city.city_id = address.city_id 