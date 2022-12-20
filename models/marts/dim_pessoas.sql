with
    pessoas as (
        select *
        from {{ref('stg_erp__person') }} 
    )

    ,pessoaendereco as (
        select *
        from {{ref('stg_erp__ businessentityaddress')}}
    )

    ,endereco as (
        select *
        from {{ref('stg_erp__address')}}
    )

    ,estado as (
        select *
        from {{ref('stg_erp__stateprovince')}}
    )

    , pais as (
        select *
        from{{ref('stg_erp__countryregion')}}
    )

    ,pessoacartaocredito as (
        select *
        from{{ref('stg_erp__ personcreditcard')}}
    )

    ,cartaocredito as (
        select *
        from{{ref('stg_erp__creditcard')}}
    )

    , joined as (
        select
            pessoas.id_pessoa
            , endereco.id_endereco
            , estado.id_estado
            , pais.id_pais
            , cidade
            , primeiro_nome
            , primeiro_sobrenome
            , segundo_sobrenome
            , cartaocredito.id_cartao_de_credito
            , estado.nome_do_estado
            , estado.sigla_estado
            , estado.data_de_modificacao_estado
            , pais.nome_pais              
            , pais.data_de_modificacao_pais
            , pessoas.data_de_modificacao_pessoa
            , pessoacartaocredito.data_de_modificacao_cartao_de_credito
            , endereco.data_de_modificacao_endereco
            , cartaocredito.tipo_do_cartao
        from pessoas
        left join pessoaendereco
        on pessoas.id_pessoa = pessoaendereco.id_pessoa
        left join endereco
        on pessoaendereco.id_endereco = endereco.id_endereco
        left join estado
        on endereco.id_estado = estado.id_estado 
        left join pais
        on  pais.id_pais = estado.id_pais
        left join pessoacartaocredito
        on pessoas.id_pessoa = pessoacartaocredito.id_pessoa
        left join cartaocredito
        on pessoacartaocredito.id_cartao_de_credito = cartaocredito.id_cartao_de_credito
    )

    , transformed as (
        select
            row_number() over (order by id_pessoa) as sk_pessoas
            , *
            from joined        
    )

  select * 
  from transformed
