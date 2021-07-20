# frozen_string_literal: true

class CreateSnowplows < ActiveRecord::Migration[6.1]
  def change
    create_table :snowplows do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
