with
    source_stateprovince as (
        select
            cast(stateprovinceid as int) as id_estado
            , cast(territoryid as int) as id_territorio
            , cast(name as string) as nome_do_estado
            , cast(stateprovincecode as string) as sigla_estado
            , cast(countryregioncode as string) as sigla_pais
            --, modifieddate
            --, rowguid
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_sequence
            --, isonlystateprovinceflag
            --, _sdc_batched_at

        from {{ source('erp', 'stateprovince') }}
    )

select *
from source_stateprovince 