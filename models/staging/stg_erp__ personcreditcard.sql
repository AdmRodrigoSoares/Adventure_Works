with
    source_personcreditcard as (
        select
            businessentityid
            , addressid               
       
        from {{ source('erp', 'personcreditcard') }}
    )

select *
from source_personcreditcard