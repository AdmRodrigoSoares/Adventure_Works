with
    source_salesreason as (
        select
            cast(salesreasonid as int) as id_razao_venda
            , cast(name as string) as razao_da_venda
            , cast(reasontype as string) as tipo_razao_da_venda
            --, modifieddate
            --, _sdc_sequence
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_batched_at

        from {{ source('erp', 'salesreason') }}
    )

select *
from source_salesreason
