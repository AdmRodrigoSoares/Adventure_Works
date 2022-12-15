with
    source_person as (
        select
            businessentityid
            , firstname
            , middlename
            , lastname

businessentityid
            , addressid               
       
        from {{ source('erp', 'person') }}
    )

select *
from source_person 