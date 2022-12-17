with
    produtos as (
        select *
        from  {{ref('dim_produtos') }} 
    )

    select *
    from produtos