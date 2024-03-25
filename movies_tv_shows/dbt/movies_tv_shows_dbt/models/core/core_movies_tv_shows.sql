{{ config(materialized="table", tags=["core"]) }}

{{ dbt_utils.log_info("Starting the transformation for the all tables.") }}

with
    movies_data as (

        select
            'Movie' as platform_type,
            title as platform_title,
            original_language as platform_original_language,
            genres as platform_genres,
            case
                when homepage like '%amazon%'
                then 'Amazon Prime'
                when homepage like '%netflix%'
                then 'Netflix'
                when homepage like '%disney%'
                then 'Disney+'
                when homepage like '%hulu%'
                then 'Hulu'
                else null
            end as platform_nam,
            vote_count as platform_vote_count,
            vote_average as platform_vote_average
        from {{ ref("stg_movies") }}

    ),
    tv_shows_data as (

        select
            'TV Show' as platform_type,
            name as platform_title,
            original_language as platform_original_language,
            genres as platform_genres,
            case
                when homepage like '%amazon%'
                then 'Amazon Prime'
                when homepage like '%netflix%'
                then 'Netflix'
                when homepage like '%disney%'
                then 'Disney+'
                when homepage like '%hulu%'
                then 'Hulu'
                else null
            end as platform_name,
            vote_count as platform_vote_count,
            vote_average as platform_vote_average
        from {{ ref("stg_tv_shows") }}

    )
select *
from movies_data
union all
select *
from tv_shows_data
limit 1000


{{ dbt_utils.log_info("The transformation for the tables is over") }}
