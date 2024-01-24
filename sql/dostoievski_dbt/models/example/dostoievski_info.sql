
-- dostoievski_info.sql

-- Use the source table as a base
WITH base_table AS (
    SELECT
        category,
        title,
        yop,
        Description,
        ROW_NUMBER() OVER () AS id  -- Generate sequential numbers
    FROM {{ ref('source_table') }}
)

-- Final model with the added primary key
SELECT
    id,
    category,
    title,
    yop,
    description
FROM base_table;
