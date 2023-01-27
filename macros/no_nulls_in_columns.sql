{% macro no_nulls_in_columns(model) -%}
SELECT *
FROM {{ model }}{# hyphen is used to trim white space #}
WHERE   {% for col in adapter.get_columns_in_relation(model) -%} 
            {{ col.column }} IS NULL OR
        {% endfor %}FALSE
{%- endmacro %}