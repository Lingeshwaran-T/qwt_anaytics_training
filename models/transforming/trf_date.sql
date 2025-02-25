{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

{% set min_orderdate = get_min_order_date() %}

{% set max_orderdate = get_max_order_date() %}

{{ dbt_date.get_date_dimension(min_orderdate, max_orderdate) }}