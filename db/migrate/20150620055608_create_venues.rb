class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :country
      t.string :region

      t.timestamps null: false
    end
  end
end
