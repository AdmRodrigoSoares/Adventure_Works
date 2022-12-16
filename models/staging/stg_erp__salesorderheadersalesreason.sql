with
    source_salesorderheadersalesreason as (
        select
            cast(salesreasonid as int) as id_razao_venda
            , cast(salesorderid as int) id_venda
            --, modifieddate
            --, _sdc_sequence
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_batched_at

        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason