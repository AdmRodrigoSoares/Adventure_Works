with
    source_salesterritory  as (
        select
            territoryid
            , countryregioncode
            , name

        from {{ source('erp', 'salesterritory') }}
    )

select *
from source_salesterritory