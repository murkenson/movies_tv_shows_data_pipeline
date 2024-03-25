{{
    config(
        pre_hook=["{{ create_table_ext('full-tmdb-tv-shows-dataset-2023-150k-shows')}}"],
        materialized="table",
        tags=["staging"],
    )
}}

{{
    dbt_utils.log_info(
        "Starting the transformation for the full TMDb TV Shows Dataset."
    )
}}


{% set filter_value = "netflix|hulu|amazom|disney" %}


select 
    cast(id as int64) as tmdb_shows_id,
    name,
    cast(number_of_seasons as int64) number_of_seasons,
    cast(number_of_episodes as int64) number_of_episodes,
    original_language,
    cast(vote_count as int64) vote_count,
    cast(vote_average as float64) vote_average,
    overview,
    cast(adult as bool) as is_adult,
    backdrop_path,
    parse_date("%Y-%m-%d", first_air_date) as first_air_date,
    parse_date("%Y-%m-%d", last_air_date) as last_air_date,
    homepage,
    cast(in_production as bool) as in_production,
    original_name,
    cast(popularity as float64) popularity,
    poster_path,
    type,
    status,
    tagline,
    genres,
    created_by,
    languages,
    networks,
    origin_country,
    spoken_languages,
    production_companies,
    production_countries,
    cast(episode_run_time as int64) episode_run_time
from {{ source("staging", "external_table_full-tmdb-tv-shows-dataset-2023-150k-shows") }}
where
    regexp_contains(homepage, r'{{ filter_value }}')
    
    {{ dbt_utils.log_info("Transformation for the full TMDb TV Shows Dataset is over") }}
