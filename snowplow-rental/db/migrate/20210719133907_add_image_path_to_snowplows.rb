# frozen_string_literal: true

class AddImagePathToSnowplows < ActiveRecord::Migration[6.1]
  def change
    add_column :snowplows, :image_path, :string
  end
end
