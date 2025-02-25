{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 

c.CUSTOMERID,
c.COMPANYNAME,
c.CONTACTNAME,
c.CITY,
c.COUNTRY,
d.DIVISIONNAME,
c.ADDRESS,
c.FAX,
c.PHONE,
c.POSTALCODE,
IFF(c.stateprovince = '','NA',c.stateprovince) as stateprovincename

from 

{{ref("stg_customers")}} as c left join {{ref('lkp_divisions')}} as d

on c.divisionid = d.divisionid