with
    source_stateprovince as (
        select
            stateprovinceid
            , name
            , territoryid
            , stateprovincecode

        from {{ source('erp', 'stateprovince') }}
    )

select *
from source_stateprovince 