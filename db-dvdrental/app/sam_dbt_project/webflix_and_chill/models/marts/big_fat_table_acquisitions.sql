{{
    config(
        materialized="table"
    )
}}

select 
    acq.acquisition_id
    ,acq.customer_id
    ,acq.store_id
    ,acq.acquisition_date
    ,acq.city_id
    ,acq.rentals

    ,cust.first_name
    ,cust.last_name
    ,cust.active_yes_no
    
    ,city.city
    ,city.country
    
    ,store.district store_district
    
from {{ ref('fact_acquisition') }} acq
left join {{ ref('dim_city') }} city
    on acq.city_id = city.city_id
left join {{ ref('dim_customer') }} cust 
    on cust.customer_id = acq.customer_id
left join {{ ref('dim_store') }} store 
    on store.store_id = acq.store_id
