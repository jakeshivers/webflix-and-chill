{{ config(
    materialized = "table"
) }}

WITH date_dimension AS (

    SELECT
        *
    FROM
        {{ ref('dates') }}
),
fiscal_periods AS (
    {{ dbt_date.get_fiscal_periods(ref('dates'), year_end_month = 1, week_start_day = 1, shift_year = 1) }})
    SELECT
        d.*,
        f.fiscal_week_of_year,
        f.fiscal_week_of_period,
        f.fiscal_period_number,
        f.fiscal_quarter_number,
        f.fiscal_period_of_quarter
    FROM
        {{ ref('dates') }}
        d
        LEFT JOIN fiscal_periods f
        ON d.date_day = f.date_day
