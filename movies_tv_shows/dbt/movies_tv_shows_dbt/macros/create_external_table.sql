{% macro create_table_ext(in_table_nm) %}

    {% set GCLOUD_PROJECT_NAME = env_var("GCLOUD_PROJECT_NAME") %}
    {% set BIGQUERY_DATASET = env_var("BIGQUERY_DATASET") %}
    {% set GCS_BUCKET_NAME = env_var("GCS_BUCKET_NAME") %}

CREATE OR REPLACE EXTERNAL TABLE
 {{ GCLOUD_PROJECT_NAME }}.{{ BIGQUERY_DATASET }}.`external_table_{{in_table_nm}}` OPTIONS ( format = 'parquet',
    uris = ['gs://{{ GCS_BUCKET_NAME }}/data/movies_tv_shows/{{in_table_nm}}*']);

{% endmacro %}
