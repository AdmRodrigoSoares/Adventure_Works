with
    source_salesorderheadersalesreason as (
        select
            salesreasonid
            , salesorderid

        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason