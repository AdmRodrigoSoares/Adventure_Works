with
    source_countryregion  as (
        select
            cast(countryregioncode as string) as id_pais
            , cast(name as string) as nome_pais              
            , cast(modifieddate as timestamp) as data_de_modificacao_pais
            --, _sdc_sequence
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_batched_at

        from {{ source('erp', 'countryregion') }}
    )

select *
from source_countryregion 