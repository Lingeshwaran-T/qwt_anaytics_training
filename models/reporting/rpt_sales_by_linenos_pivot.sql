{{config(materialized = 'view', schema = 'reporting_dev')}}

{% set v_linenumber = get_line_numbers() %}

select 

orderid,

{% for linenumber in v_linenumber -%}

sum(case when lineno={{linenumber}} then linesalesamount end ) as lineno{{linenumber}}_sales,

{% endfor -%}

sum(linesalesamount) as total_sales


from 

{{ref("fct_orders")}}
group by orderid