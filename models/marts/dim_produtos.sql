with
    produtos as (
        select
            id_produto
            , nome_do_produto
            , preco_de_tabela
            , tamanho
            , cor
            , peso
            , preco_de_custo
        from {{ref('stg_erp__product') }} 
    )

    , transformed_produtos as (
        select
            row_number() over (order by id_produto) as sk_produto
            , *
            from produtos        
    )

  select * 
  from transformed_produtos