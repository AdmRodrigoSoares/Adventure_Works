with
    source_salesorderdetail as (
        select
            salesorderdetailid
            , salesorderid
            , unitprice
            , productid
            , unitpricediscount
       
        from {{ source('erp', 'salesorderdetail') }}
    )

select *
from source_salesorderdetail