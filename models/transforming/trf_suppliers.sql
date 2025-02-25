{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
GET(XMLGET(suppliersinfo, 'SupplierID'),'$') as supplierid,
GET(XMLGET(suppliersinfo, 'CompanyName'),'$')::varchar as companyname,
GET(XMLGET(suppliersinfo, 'ContactName'),'$')::varchar as ContactName,
GET(XMLGET(suppliersinfo, 'Address'),'$')::varchar as Address,
GET(XMLGET(suppliersinfo, 'City'),'$')::varchar as City,
GET(XMLGET(suppliersinfo, 'PostalCode'),'$')::varchar as PostalCode,
GET(XMLGET(suppliersinfo, 'Country'),'$')::varchar as Country,
GET(XMLGET(suppliersinfo, 'Phone'),'$')::varchar as Phone,
GET(XMLGET(suppliersinfo, 'Fax'),'$')::varchar as Fax

from 
{{ref("stg_suppliers")}}