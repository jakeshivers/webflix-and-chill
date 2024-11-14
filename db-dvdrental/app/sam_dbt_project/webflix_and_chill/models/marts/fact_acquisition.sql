{{
    config(
        materialized="table"
    )
}}

select
    cust.CUSTOMER_ID||cust.CREATE_DATE acquisition_id
    ,cust.CUSTOMER_ID
    ,cust.CREATE_DATE ACQUISITION_DATE
    ,add.CITY_ID
    ,count(rentals.rental_id) rentals
FROM {{ source('dvd_rental', 'customer') }} as cust
JOIN {{ source('dvd_rental', 'address') }} as add 
    ON cust.address_id = add.address_id
JOIN {{ source('dvd_rental', 'rental') }} as rentals     
    ON rentals.customer_id = cust.customer_id
GROUP BY cust.CUSTOMER_ID||cust.CREATE_DATE
    ,cust.CUSTOMER_ID
    ,cust.CREATE_DATE
    ,add.CITY_ID
ORDER BY cust.CUSTOMER_ID    
