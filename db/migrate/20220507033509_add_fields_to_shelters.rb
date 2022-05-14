# typed: true
# frozen_string_literal: true

class AddFieldsToShelters < ActiveRecord::Migration[7.0]
  def change
    execute "DELETE FROM shelters"

    add_column :shelters, :website_url, :string
    add_column :shelters, :address, :string, null: false
    add_column :shelters,
               :location,
               :geometry,
               geographic: true,
               srid: 4326,
               null: false
    add_column :shelters, :food_availability, :string
    add_column :shelters, :tags, :string, array: true, null: false, default: []
  end
end
