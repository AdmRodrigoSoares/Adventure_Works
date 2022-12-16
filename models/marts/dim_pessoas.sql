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
            p.id_pessoa
            , e.id_endereco as fk_endereco
            , es.id_estado as fk_estado
            , pa.id_pais as fk_pais
            , c.id_cartao_de_credito as fk_cartao_de_credito
            , es.nome_do_estado
            , es.sigla_estado
            , pa.nome_pais              
            , p.data_de_modificacao_pessoa
            , pc.data_de_modificacao_cartao_de_credito
            , e.data_de_modificacao_endereco
            , pa.data_de_modificacao_pais
            , es.data_de_modificacao_estado
            , c.tipo_do_cartao             
        from pessoas p
        left join pessoaendereco pe
        on p.id_pessoa = pe.id_pessoa
        left join endereco e
        on pe.id_endereco = e.id_endereco
        left join estado es
        on e.id_estado = es.id_estado 
        left join pais pa
        on  pa.id_pais = es.id_pais
        left join pessoacartaocredito pc
        on p.id_pessoa = pc.id_pessoa
        left join cartaocredito c
        on pc.id_cartao_de_credito = c.id_cartao_de_credito
    )

    , transformed as (
        select
            row_number() over (order by id_pessoa) as sk_pessoas
            , *
            from joined        
    )

  select * 
  from transformed
