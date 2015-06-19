class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.string :region

      t.timestamps null: false
    end
  end
end
