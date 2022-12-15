with
    source_salesorderheader as (
        select
            salesorderid
            , territoryid
            , creditcardid
            , businessentityid
            , customerid
            , addressid               
            , orderdate
            , freight
            , duedate
            , totaldue
            , subtotal
       
        from {{ source('erp', 'salesorderheader') }}
    )

select *
from source_salesorderheader 