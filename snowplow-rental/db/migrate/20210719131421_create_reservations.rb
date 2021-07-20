# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :snowplow, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.datetime :since
      t.datetime :until

      t.timestamps
    end
  end
end
