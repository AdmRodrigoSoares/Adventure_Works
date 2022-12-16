with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as id_venda
            , cast(creditcardid as int) as id_catao_de_credito
            , cast(customerid as int) as id_consumidor
            , cast(orderdate as timestamp) as data_da_venda
            , cast(freight as numeric) as frete
            , cast(duedate as timestamp) as data_vencimento
            , cast(totaldue as numeric) as total
            , cast(subtotal as numeric) as subtotal
            --, purchaseordernumber
            --, shipmethodid
            --, billtoaddressid
            --, salespersonid
            --, modifieddate
            --, rowguid
            --, taxamt
            --, shiptoaddressid
            --, onlineorderflag
            --, _sdc_table_version
            --, territoryid
            --, status
            --, currencyrateid
            --, _sdc_received_at
            --, _sdc_sequence
            --, creditcardapprovalcode
            --, revisionnumber
            --, shipdate
            --, _sdc_batched_at
            --, accountnumber
       
        from {{ source('erp', 'salesorderheader') }}
    )

select *
from source_salesorderheader 