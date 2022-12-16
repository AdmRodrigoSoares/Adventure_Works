with
    pessoas as (
        select *
        from {{ref('stg_erp__person') }} 
    )

    ,businessentityaddress as (
        select *
        from {{ref('stg_erp__ businessentityaddress')}}
    )

    ,address as (
        select *
        from {{ref('stg_erp__address')}}
    )

    ,stateprovince{{ ref('stg_erp__stateprovince')}}
    )

    ,countryregion as (
        select *
        from{{ref('stg_erp__countryregion')}}
    )

    ,personcreditcard as (
        select *
        from{{ref('stg_erp__ personcreditcard')}}
    )

    ,creditcard as (
        select *
        from{{ref('stg_erp__creditcard')}}
    )

    , joined as (
        select
            businessentityid
            , id_endereco as fk_endereco
            , id_estado as fk_estado
            , id_pais as fk_pais
            , id_cartao_de_credito as fk_cartao_de_credito
            , estado
            , sigla_estado
            , sigla_pais
            , nome_pais              
            , data_de_modificacao_pessoa
            , data_de_modificacao_cartao_de_credito
            , data_de_modificacao_endereco
            , data_de_modificacao_pais
            , data_de_modificacao_estado
            , tipo_do_cartao             
        from person.person p
        left join person.businessentityaddress b
        on p.businessentityid = b.businessentityid
        left join person.address a
        on b.addressid = a.addressid 
        left join person.stateprovince sp
        on a.stateprovinceid = sp.stateprovinceid 
        left join person.countryregion cr
        on sp.countryregioncode = cr.countryregioncode 
        left join sales.personcreditcard pc
        on p.businessentityid = pc.businessentityid 
        left join sales.creditcard c
        on pc.creditcardid = c.creditcardid
    )

    , transformed as (
        select
            {{ dbt_utils.surrogate_key(['businessentityid', 'addressid']) }} as sk_pessoas
            , *
            from joined        
    )

  select * 
  from transformed
