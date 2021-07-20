# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :snowplow

  validates :snowplow, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :since, presence: true
  validates :until, presence: true
  validate :until_in_future?
  validate :is_long_enough?
  validate :doesnt_overlap_with_other_reservations?

  def until_in_future?
    errors.add(:until, 'must be in the future') if self.until < DateTime.now
  end

  def is_long_enough?
    errors.add(:until, 'must be at least 1 hour after start of reservation') if self.until - since < 1.hour
  end

  def doesnt_overlap_with_other_reservations?
    query = Reservation.where('until > ? AND since < ?', since, self.until)
    query = query.where('id <> ?', id) unless id.nil?
    if query.count.positive?
      errors.add(:since, 'overlaps with other reservations')
      errors.add(:until, 'overlaps with other reservations')
    end
  end

  def to_snowplow_json
    SnowplowTracker::SelfDescribingJson.new(
      'iglu:test.example.iglu/reservation/jsonschema/1-0-0',
      {
        'snowplow_name' => snowplow.name,
        'first_name' => first_name,
        'last_name' => last_name,
        'since' => since,
        'until' => self.until,
      }
    )
  end
end
