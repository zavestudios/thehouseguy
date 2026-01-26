# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[8.1]
  def change
    create_table :listings do |t|
      t.string :external_id, null: false
      t.string :source, null: false, default: 'ames'
      t.string :address_line
      t.string :city
      t.string :state
      t.string :zip
      t.integer :price
      t.integer :beds
      t.decimal :baths, precision: 4, scale: 2
      t.integer :sqft
      t.integer :year_built
      t.integer :lot_sqft
      t.date :sold_at

      t.timestamps
    end

    add_index :listings, %i[source external_id], unique: true
  end
end
