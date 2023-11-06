{% snapshot snapshot_room %}

    {{
        config(
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='listing_id',
          updated_at='scraped_date',
        )
    }}

    select listing_id, scraped_date, room_type, accommodates, price, has_availability, availability_30 from {{ ref('listings') }}

{% endsnapshot %}