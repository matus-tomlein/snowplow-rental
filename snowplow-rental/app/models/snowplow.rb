# frozen_string_literal: true

class Snowplow < ApplicationRecord
  has_many :reservations

  def future_reservations
    reservations.where('until > ?', DateTime.now)
  end

  def to_snowplow_json
    SnowplowTracker::SelfDescribingJson.new(
      'iglu:test.example.iglu/snowplow/jsonschema/1-0-0',
      {
        'name' => name,
        'description' => description
      }
    )
  end
end
