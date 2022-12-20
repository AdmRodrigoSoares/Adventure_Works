with
    pedidos as (
        select
            id_venda
            , id_cartao_de_credito
            , id_consumidor
            , data_da_venda
            , frete
            , data_vencimento
            , total
            , subtotal
        from {{ ref('stg_erp__salesorderheader') }}
    )

    , pedidos_detalhes as (
        select
            id_detalhe_de_venda
            , id_venda
            , id_produto
            , preco_unitario
            , desconto
            , quantidade
        from {{ ref('stg_erp__salesorderdetail') }}
    )

    , pedidos_razao as (
        select
            id_venda
            , id_razao_venda
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )

    , razao as (
        select
            id_razao_venda
            , razao_da_venda
            , tipo_razao_da_venda
        from {{ ref('stg_erp__salesreason') }}
    )

    , joined as (
        select
            pedidos_detalhes.id_detalhe_de_venda
            , pedidos_detalhes.id_produto
            , pedidos_detalhes.preco_unitario
            , pedidos_detalhes.desconto
            , pedidos_detalhes.quantidade
            , pedidos.id_venda
            , pedidos.id_cartao_de_credito
            , pedidos.id_consumidor
            , pedidos.data_da_venda
            , pedidos.frete
            , pedidos.data_vencimento
            , pedidos.total
            , pedidos.subtotal
            , pedidos_razao.id_razao_venda
            , razao.razao_da_venda
            , razao.tipo_razao_da_venda
        from pedidos
        left join pedidos_detalhes on pedidos.id_venda = pedidos_detalhes.id_venda
        left join pedidos_razao on pedidos.id_venda = pedidos_razao.id_venda
        left join razao on pedidos_razao.id_razao_venda = razao.id_razao_venda
    )

select * 
from joined
