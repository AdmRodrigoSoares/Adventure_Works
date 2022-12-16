with
    source_product as (
        select
            cast(productid as int) as id_produto
            , cast(name as string) as nome_do_produto
            , cast(listprice as numeric) as preco_de_tabela
            , cast(size as string) as tamanho
            , cast(color as string) as cor
            , cast(weight as string) as peso
            , cast(standardcost as numeric) as preco_de_custo
            --, sellenddate
            --, safetystocklevel
            --, finishedgoodsflag
            --, class
            --, makeflag
            --, productnumber
            --, reorderpoint
            --, modifieddate
            --, rowguid
            --, productmodelid
            --, weightunitmeasurecode
            --, _sdc_table_version
            --, style
            --, sizeunitmeasurecode
            --, productsubcategoryid
            --, _sdc_received_at
            --, _sdc_sequence
            --, daystomanufacture
            --, productline
            --, _sdc_batched_at
            --, sellstartdate
       
        from {{ source('erp', 'product') }}
    )

select *
from source_product