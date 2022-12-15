with
    source_Address as (
        select
            addressid                
            , stateprovinceid
          - , city
          - , addressline2
          - , modifieddate
          - , rowguid
          - , _sdc_table_version
          - , postalcode
          - , spatiallocation
          - , _sdc_received_at
          - , _sdc_sequence
          - , addressline1
          - , _sdc_batched_at           
            , cast(description as string) as descricao_categoria        
        from {{ source('erp', 'Address') }}
    )

select *
from source_Address
