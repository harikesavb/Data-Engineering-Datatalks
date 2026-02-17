{% macro safe_cast(column, data_type) %}
    {% if target.type == 'duckdb' %}
        try_cast({{ column }} as {{ data_type }})
    {% elif target.type == 'bigquery' %}
        safe_cast({{ column }} as {{ data_type }})
    {% else %}
        cast({{ column }} as {{ data_type }})
    {% endif %}
{% endmacro %}
