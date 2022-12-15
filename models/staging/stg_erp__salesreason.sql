with
    source_salesreason as (
        select
            salesreasonid
            , name

        from {{ source('erp', 'salesreason') }}
    )

select *
from source_salesreason
