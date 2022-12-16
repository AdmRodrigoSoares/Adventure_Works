with
    source_salesterritory  as (
        select
            cast(territoryid as int) as id_territorio
            , cast(countryregioncode as string) as sigla_pais
            , cast(name as string) as nome_do_territorio
            , cast('group' as string) as continente
            --, modifieddate
            --, rowguid
            --, saleslastyear
            --, _sdc_table_version
            --, costytd
            --, _sdc_received_at
            --, _sdc_sequence
            --, _sdc_batched_at
            --, costlastyear
            --, salesytd

        from {{ source('erp', 'salesterritory') }}
    )

select *
from source_salesterritory