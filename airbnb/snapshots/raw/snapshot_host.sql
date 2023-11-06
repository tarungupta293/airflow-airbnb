{% snapshot snapshot_host %}

    {{
        config(
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='listing_id',
          updated_at='scraped_date',
        )
    }}

    select listing_id, scraped_date, host_id, host_name, host_since, host_is_superhost, host_neighbourhood, listing_neighbourhood from {{ ref('listings') }}

{% endsnapshot %}