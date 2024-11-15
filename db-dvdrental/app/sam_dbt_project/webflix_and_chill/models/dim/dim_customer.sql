{{
    config(
        materialized="table"
    )
}}

select
    cust.CUSTOMER_ID
    ,cust.FIRST_NAME
    ,cust.LAST_NAME
    ,cust.ACTIVEBOOL ACTIVE_YES_NO
FROM {{ source('dvd_rental', 'customer') }} as cust
