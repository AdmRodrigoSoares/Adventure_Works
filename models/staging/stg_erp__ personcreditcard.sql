with
    source_personcreditcard as (
        select
            cast(businessentityid as int) as id_pessoa
            , cast(creditcardid as int) as id_catao_de_credito
            , cast(modifieddate as timestamp) as data_de_modificacao
            --, _sdc_sequence
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_batched_at
       
        from {{ source('erp', 'personcreditcard') }}
    )

select *
from source_personcreditcard