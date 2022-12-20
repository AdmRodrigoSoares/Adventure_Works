with
    produtos as (
        select *
        from  {{ref('dim_produtos') }} 
    )

    , pessoas as (
        select *
        from {{ref('dim_pessoas')}}
    )

    , vendas as (
        select *
        from{{ref('int_vendas')}}
    )

    , joined as (
        select
            id_detalhe_de_venda as fk_detalhe_de_venda
            , vendas.id_produto as fk_produto
            , vendas.id_venda as fk_venda
            , vendas.id_consumidor as fk_consumidor
            , pessoas.id_pessoa as fk_pessoa
            , pessoas.id_endereco as fk_endereco
            , pessoas.id_estado as fk_estado
            , pessoas.id_pais as fk_pais
            , pessoas.id_cartao_de_credito as fk_cartao_de_credito
            , vendas.id_razao_venda as fk_razao_venda
            , produtos.id_produto
            , vendas.preco_unitario
            , vendas.desconto
            , vendas.quantidade
            , vendas.data_da_venda
            , vendas.frete
            , vendas.data_vencimento
            , vendas.total
            , vendas.subtotal
            , vendas.razao_da_venda
            , vendas.tipo_razao_da_venda
            , pessoas.nome_do_estado
            , pessoas.sigla_estado
            , pessoas.data_de_modificacao_estado
            , pessoas.nome_pais              
            , pessoas.data_de_modificacao_pais
            , pessoas.data_de_modificacao_pessoa
            , pessoas.data_de_modificacao_cartao_de_credito
            , pessoas.data_de_modificacao_endereco
            , pessoas.tipo_do_cartao
            , produtos.nome_do_produto
            , produtos.preco_de_tabela
            , produtos.tamanho
            , produtos.cor
            , produtos.peso
            , produtos.preco_de_custo 
        from vendas
        left join pessoas on pessoas.id_cartao_de_credito = vendas.id_cartao_de_credito
        left join produtos on vendas.id_produto = produtos.id_produto
    )

    select *
    from joined