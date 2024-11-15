{% snapshot dim_actor %}
    {{ config(
        target_schema = 'MARTS',
        unique_key = 'ACTOR_ID',
        updated_at = 'LAST_UPDATE',
        invalidate_hard_deletes = True
    ) }}

    SELECT
        *
    FROM
        {{ source(
            'dvd_rental',
            'actor'
        ) }} AS actor
{% endsnapshot %}
