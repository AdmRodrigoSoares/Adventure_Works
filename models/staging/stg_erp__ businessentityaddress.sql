with
    source_businessentityaddress as (
        select
            businessentityid
            , addressid               
       
        from {{ source('erp', 'businessentityaddress') }}
    )

select *
from source_businessentityaddress 