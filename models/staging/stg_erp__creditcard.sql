with
    source_creditcard  as (
        select
            cast(creditcardid as int) as id_cartao_de_credito
            , cast(cardtype as string) as tipo_do_cartao 
            --, expyear
            --, modifieddate
            --, _sdc_table_version
            --, expmonth
            --, _sdc_received_at
            --, _sdc_sequence
            --, cardnumber
            --, _sdc_batched_at  
       
        from {{ source('erp', 'creditcard') }}
    )

select *
from source_creditcard 