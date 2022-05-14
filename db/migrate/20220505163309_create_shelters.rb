# typed: true
# frozen_string_literal: true

class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :slug, null: false, index: { unique: true }
      t.text :about, null: false
      t.string :contact_email, index: { unique: true }
      t.string :contact_phone, index: { unique: true }

      t.timestamps
    end
  end
end
