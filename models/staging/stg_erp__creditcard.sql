with
    source_creditcard  as (
        select
            creditcardid
            , cardtype               
       
        from {{ source('erp', 'creditcard') }}
    )

select *
from source_creditcard 