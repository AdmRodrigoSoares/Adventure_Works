with
    source_countryregion  as (
        select
            countryregioncode
            , name               
       
        from {{ source('erp', 'countryregion') }}
    )

select *
from source_countryregion 