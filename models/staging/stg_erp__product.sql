with
    source_product as (
        select
            productid
            , name
            , class
            , listprice
            , size
            , color
            , weight
            , productline
            , standardcost
       
        from {{ source('erp', 'product') }}
    )

select *
from source_product