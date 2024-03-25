{{
    config(
        pre_hook=["{{ create_table_ext('tmdb-movies-dataset-2023-930k-movies')}}"],
        materialized="table",
        tags=["staging"],
    )
}}

{{
    dbt_utils.log_info(
        "Starting the transformation for the full TMDb Movies Dataset."
    )
}}


{% set filter_value = "netflix|hulu|amazom|disney" %}


select
    cast(id as int64) as tmdb_movies_id,
    title as title,
    cast(vote_average as float64) as vote_average,
    cast(vote_count as int64) as vote_count,
    status,
    parse_date("%Y-%m-%d", release_date) as release_date,
    cast(revenue as int64) as revenue,
    cast(runtime as int64) as runtime,
    cast(adult as bool) as is_adult,
    backdrop_path,
    cast(budget as int64) as budget,
    homepage,
    imdb_id,
    original_language,
    original_title,
    overview,
    cast(popularity as float64) as popularity,
    poster_path,
    tagline,
    genres,
    production_companies as production_companies,
    production_companies as production_countries,
    spoken_languages as spoken_languages

from {{ source("staging", "external_table_tmdb-movies-dataset-2023-930k-movies") }}

where
    regexp_contains(homepage, r'{{ filter_value }}')

    {{ dbt_utils.log_info("Transformation for the full TMDb Movies Dataset is over") }}
