with
    source_person as (
        select
            cast(businessentityid as int) as id_pessoa
            , cast(firstname as string) as primeiro_nome
            , cast(middlename as string) as primeiro_sobrenome
            , cast(lastname as string) as segundo_sobrenome
            , cast(modifieddate as timestamp) as data_de_modificacao
            --, persontype
            --, namestyle
            --, suffix
            --, rowguid
            --, _sdc_table_version
            --, emailpromotion
            --, _sdc_received_at
            --, _sdc_sequence
            --, title
            --, _sdc_batched_at
       
        from {{ source('erp', 'person') }}
    )

select *
from source_person 