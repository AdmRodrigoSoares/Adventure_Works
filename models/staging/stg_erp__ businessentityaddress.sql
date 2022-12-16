with
    source_businessentityaddress as (
        select
            cast(businessentityid as int) as id_pessoa
            , cast(addressid as int) as id_endereco
            --rowguid
            --_sdc_table_version
            --addresstypeid
            --_sdc_received_at
            --_sdc_sequence
            --_sdc_batched_at
       
        from {{ source('erp', 'businessentityaddress') }}
    )

select *
from source_businessentityaddress 