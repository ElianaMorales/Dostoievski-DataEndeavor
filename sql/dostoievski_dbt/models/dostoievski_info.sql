{{ config(
    materialized='table'
) }}

WITH base_table AS (
    SELECT
        category,
        title,
        yo_p as yop,
        descr as descr,
        ROW_NUMBER() OVER() AS id,
        _fivetran_synced as update_time
    FROM {{ source('source', 'dostievski_info') }}
)

-- Final model with the added primary key
SELECT
    id,
    category,
    title,
    yop,
    descr,
    update_time
FROM base_table