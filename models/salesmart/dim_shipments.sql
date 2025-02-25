{{config(materialized = 'view', schema = 'salesmart_dev')}}

select *
--OrderID,
--LineNo,
--companyname,
--ShipmentDate,
--Status
from 
{{ref("trf_shipments")}}