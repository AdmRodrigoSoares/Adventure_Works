with
    source_address as (
        select
            cast(addressid as int) as id_endereco
            , cast(stateprovinceid as int) as id_estado
            , cast(city as string) as cidade
            , cast(addressline1 as string) as endereco
            , cast(addressline2 as string) as endereco_complemento
            , cast(modifieddate as timestamp) as data_de_modificacao_endereco
            , cast(postalcode as string) as codigo_postal
            --, rowguid
            --, _sdc_table_version
            --, spatiallocation
            --, _sdc_received_at
            --, _sdc_sequence
            --, _sdc_batched_at

        from {{ source('erp', 'address') }}
    )

select *
from source_address
