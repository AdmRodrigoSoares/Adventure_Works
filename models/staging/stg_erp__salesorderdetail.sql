with
    source_salesorderdetail as (
        select
            cast(salesorderdetailid as int) as id_detalhe_de_venda
            , cast(salesorderid as int) as id_venda
            , cast(productid as int) as id_produto
            , cast(unitprice as numeric) as preco_unitario
            , cast(unitpricediscount as numeric) as desconto
            , cast(orderqty as numeric) as quantidade
            --, specialofferid
            --, modifieddate
            --, rowguid
            --, _sdc_table_version
            --, _sdc_received_at
            --, _sdc_sequence
            --, _sdc_batched_at
            --, carriertrackingnumber

        from {{ source('erp', 'salesorderdetail') }}
    )

select *
from source_salesorderdetail