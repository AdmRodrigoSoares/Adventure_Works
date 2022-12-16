with
    source_stateprovince as (
        select
            cast(stateprovinceid as int) as id_estado
            , cast(countryregioncode as string) as id_pais
            , cast(name as string) as nome_do_estado
            , cast(stateprovincecode as string) as sigla_estado
            , cast(modifieddate as timestamp) as data_de_modificacao_estado
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