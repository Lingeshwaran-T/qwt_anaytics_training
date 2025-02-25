{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select

p.ProductID,
p.productname,
c.categoryname,
s.CompanyName as suppliercompany,
s.ContactName as suppliercontact,
s.City as suppliercity,
s.Country as suppliercountry,
p.quantityperunit,
p.UnitCost,
p.UnitPrice,
p.unitsinstock,
p.unitsonorder,
TO_DECIMAL (p.UnitPrice - p.UnitCost, 9, 2 ) as profit,
IFF(p.unitsonorder > p.unitsinstock, 'Not Available', 'Available') as productavailability

from

{{ref("stg_products")}} as p
left join {{ref("trf_suppliers")}} as s
on p.supplierid = s.supplierid
left join {{ref("lkp_categories")}} as c
on c.categoryid = p.categoryid