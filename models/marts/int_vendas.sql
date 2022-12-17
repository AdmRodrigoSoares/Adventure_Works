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
            pd.id_detalhe_de_venda
            , pd.id_produto
            , pd.preco_unitario
            , pd.desconto
            , pd.quantidade
            , p.id_venda
            , p.id_cartao_de_credito
            , p.id_consumidor
            , p.data_da_venda
            , p.frete
            , p.data_vencimento
            , p.total
            , p.subtotal
            , pr.id_razao_venda
            , r.razao_da_venda
            , r.tipo_razao_da_venda
        from pedidos p
        left join pedidos_detalhes pd on p.id_venda = pd.id_venda
        left join pedidos_razao pr on p.id_venda = pr.id_razao_venda
        left join razao r on pr.id_razao_venda = r.id_razao_venda
    )

select * 
from joined
