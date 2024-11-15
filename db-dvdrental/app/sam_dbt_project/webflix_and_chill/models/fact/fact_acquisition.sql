{{ config(
    materialized = "table"
) }}

SELECT
    cust.customer_id || cust.create_date acquisition_id,
    cust.customer_id,
    cust.create_date acquisition_date,
ADD.city_id,
    COUNT(
        rentals.rental_id
    ) rentals
FROM
    {{ ref('customer') }} AS cust
    JOIN {{ ref('address') }} AS
ADD
    ON cust.address_id =
ADD.address_id
    JOIN {{ ref('rental') }} AS rentals
    ON rentals.customer_id = cust.customer_id
GROUP BY
    cust.customer_id || cust.create_date,
    cust.customer_id,
    cust.create_date,
ADD.city_id
ORDER BY
    cust.customer_id
